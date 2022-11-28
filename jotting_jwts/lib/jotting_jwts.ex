defmodule JottingJwts do
  require Logger

  @base_uri "https://hackattic.com/challenges/jotting_jwts/"
  @request_uri "problem?access_token=972b50c2c093c1f8"
  @response_uri "solve?access_token=972b50c2c093c1f8"
  @public_url "https://ef32-2406-3003-2073-3e3c-2c3f-2121-89f9-a879.ap.ngrok.io"

  def get_jwt_secret do
    {:ok, response} = Req.get("#{@base_uri}#{@request_uri}")
    Map.get(response.body, "jwt_secret")
  end

  def submit_url() do
    response =
      Req.post!("#{@base_uri}#{@response_uri}",
        receive_timeout: :infinity,
        json: %{app_url: @public_url}
      )

    if response.status == 200 do
      Logger.info("App URL submission success")
    else
      Logger.error("App URL submission failed")
    end
  end
end
