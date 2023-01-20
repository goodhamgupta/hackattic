defmodule TalesOfSsl do

  @base_uri "https://hackattic.com/challenges/tales_of_ssl/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def generate do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    %{"private_key" => private_key, "required_data" => %{"domain" => domain, "serial_number" => serial_number, "country" => country}} = response.body
    rsa_key = "-----BEGIN RSA PRIVATE KEY----- \n#{private_key}\n-----END RSA PRIVATE KEY-----"
    country_code = Countries.filter_by(:name, country) |> List.first() |> Map.get(:alpha2)
    :ok = File.write("private.key", rsa_key)
    System.cmd("openssl", [
      "req",
      "-new",
      "-key",
      "private.key",
      "-outform",
      "PEM",
      "-verify",
      "-set_serial",
      "#{serial_number}",
      "-subj",
      "/CN=#{domain}/C=#{country_code}/",
      "-out",
      "domain.crt",
      "-verbose",
      "-text"
    ])
  end
end

TalesOfSsl.generate()
