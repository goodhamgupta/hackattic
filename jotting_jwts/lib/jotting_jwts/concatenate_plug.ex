defmodule JottingJwts.ConcatenatePlug do
  import Plug.Conn

  alias JottingJwts.Token

  @table :signer_table

  def init(options), do: options

  def call(conn, _opts) do
    IO.inspect(conn)
    [signer] = :ets.lookup(@table, :signer)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{solution: "test"}))
  end
end
