defmodule ReadingQR do
  @base_uri "https://hackattic.com/challenges/reading_qr/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"

  def parse() do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    url = response.body |> Map.get("image_url")
    {:ok, img_response} = Req.get(url)
    File.write("test.png", img_response.body)
    {qr_response, _} = System.cmd("zbarimg", ["-q", "test.png"])
    code = qr_response |> String.trim() |> String.split(":") |> List.last()

    response = Req.post!("#{@base_uri}#{@response_uri}", json: %{code: code})

    if response.status == 200 do
      IO.puts("Solution accepted")
    else
      IO.puts("Solution not accepted")
    end
  end
end

ReadingQR.parse()
