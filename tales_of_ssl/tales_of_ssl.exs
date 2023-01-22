defmodule TalesOfSsl do

  @base_uri "https://hackattic.com/challenges/tales_of_ssl/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def generate do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    %{"private_key" => private_key, "required_data" => %{"domain" => domain, "serial_number" => serial_number, "country" => country}} = response.body
    rsa_key = "-----BEGIN RSA PRIVATE KEY----- \n#{private_key}\n-----END RSA PRIVATE KEY-----"
    country_code = country |> String.split(" ") |> Enum.map(fn x -> String.first(x) end) |> Enum.join()
    :ok = File.write("private.key", rsa_key)
    IO.puts(domain)
    IO.puts(serial_number)
    IO.puts(country)
    System.cmd("openssl", [
      "req",
      "-new",
      "-key",
      "private.key",
      "-outform",
      "PEM",
      "-set_serial",
      "#{serial_number}",
      "-subj",
      "/CN=#{domain}/C=#{country_code}/",
      "-out",
      "domain.csr"
    ])
    {certificate, exit_code} = System.cmd("openssl", ["req", "-in", "domain.csr", "-text", "-noout"])
    IO.puts(certificate)
    response = Req.post!("#{@base_uri}#{@response_uri}", json: %{certificate: Base.encode64(certificate)})

    if response.status == 200 and !Map.has_key?(response.body, "rejected") do
      IO.puts("Solution accepted")
    else
      IO.puts("Solution not accepted")
      IO.inspect(response)
    end

  end
end

TalesOfSsl.generate()
