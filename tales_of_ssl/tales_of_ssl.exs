defmodule TalesOfSsl do

  @base_uri "https://hackattic.com/challenges/tales_of_ssl/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def generate do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    %{"private_key" => private_key, "required_data" => %{"domain" => domain, "serial_number" => serial_number, "country" => country}} = response.body
    :ok = File.write("private.key", private_key)
    System.cmd("openssl", [
      "req",
      "-key",
      "private.key",
      "-des3",
      "-out",
      "domain.crt"
    ])
  end
end

TalesOfSsl.generate()
