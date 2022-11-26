defmodule JottingJwts.ResponsePlug do
  import Plug.Conn

  @moduledoc """
  Documentation for `JottingJwts`.
  """

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Thug life")
  end
end
