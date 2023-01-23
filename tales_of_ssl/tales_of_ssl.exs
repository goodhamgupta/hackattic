defmodule TalesOfSsl do

  @base_uri "https://hackattic.com/challenges/tales_of_ssl/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def generate do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    %{"private_key" => private_key, "required_data" => %{"domain" => domain, "serial_number" => serial_number, "country" => country}} = response.body
    {:ok, pkey} = Base.decode64(private_key)
    country_code = country |> String.split(" ") |> Enum.map(fn x -> String.first(x) end) |> Enum.join()
    {:ok, ca_key} = X509.PrivateKey.from_der(pkey)
    {serial_num_decimal, _} = serial_number |> String.slice(2..-1) |> Integer.parse(16) # Parse hex and convert to integer
    certificate =
      ca_key
      |> X509.Certificate.self_signed(
        "/C=#{country_code}/CN=#{domain}",
        serial: serial_num_decimal,
        template: :root_ca
        )
      |> X509.Certificate.to_der()
      |> Base.encode64()
    IO.puts("Generated certificate")
    IO.puts(certificate)
    response = Req.post!("#{@base_uri}#{@response_uri}", json: %{certificate: certificate})

    if response.status == 200 and !Map.has_key?(response.body, "rejected") do
      IO.puts("Solution accepted")
    else
      IO.puts("Solution not accepted")
      IO.inspect(response)
    end

  end
end

TalesOfSsl.generate()
