defmodule BruteForceZip do
  @base_uri "https://hackattic.com/challenges/brute_force_zip/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def parse() do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    url = response.body |> Map.get("zip_url")
    {:ok, {_status, _headers, bytes}} = :httpc.request(:get, {url, []}, [], [])
    :ok = File.write("input.zip", bytes)

    require IEx
    IEx.pry()
  end
end

BruteForceZip.parse()
