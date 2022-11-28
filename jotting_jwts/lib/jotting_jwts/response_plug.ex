defmodule JottingJwts.ResponsePlug do
  import Plug.Conn

  @moduledoc """
  Documentation for `JottingJwts`.
  """

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{shampoo: "ned it"}))
  end
end
