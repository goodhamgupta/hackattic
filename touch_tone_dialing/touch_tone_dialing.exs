defmodule TouchToneDialing do
  @base_uri "https://hackattic.com/challenges/touch_tone_dialing/"
  @request_uri "problem?access_token=#{Application.compile_env(:touch_tone_dialing, :token, "test")}"
  @response_uri "solve?access_token=#{Application.compile_env(:touch_tone_dialing, :token, "test")}"

  def generate do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")

    %{
      "wav_url" => wav_url
    } = response.body

    IO.puts(wav_url)
  end
end

TouchToneDialing.generate()
