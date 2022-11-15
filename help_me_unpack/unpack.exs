defmodule Unpack do
  @base_uri "https://hackattic.com/challenges/help_me_unpack/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def parse do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    {:ok, bytes} = response.body |> Map.get("bytes") |> Base.decode64()

    <<rint::little-signed-integer-size(32), ruint::little-unsigned-integer-size(32),
      rshort::little-signed-size(16), _random::little-signed-size(16),
      rfloat::little-unsigned-float-size(32), rdouble::little-signed-float-size(64),
      rendian::big-signed-float-size(64), _rest::binary>> = bytes

    result_json = %{
      int: rint,
      uint: ruint,
      short: rshort,
      float: rfloat,
      double: rdouble,
      big_endian_double: rendian
    }

    response = Req.post!("#{@base_uri}#{@response_uri}", json: result_json)

    if response.status == 200 do
      IO.puts("Solution accepted")
    else
      IO.puts("Solution not accepted")
    end
  end
end

Unpack.parse()
