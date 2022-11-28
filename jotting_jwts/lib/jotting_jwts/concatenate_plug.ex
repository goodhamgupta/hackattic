defmodule JottingJwts.ConcatenatePlug do
  import Plug.Conn

  alias JottingJwts.Token

  @table :signer_table

  def init(options), do: options

  def call(conn, opts) do
    {:ok, body, conn} = Plug.Conn.read_body(conn, opts)
    [signer: signer] = :ets.lookup(@table, :signer)

    verification = Token.verify_and_validate(body, signer)

    map =
      case verification do
        {:ok, map} -> map
        {:error, _} -> %{}
      end

    value = process(map)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{solution: value}))
  end

  defp process(%{"append" => append, "exp" => _exp}) do
    [append: value] = :ets.lookup(@table, :append)
    new_val = "#{value}#{append}"
    :ets.insert(@table, {:append, new_val})
  end

  defp process(_map) do
    [append: value] = :ets.lookup(@table, :append)
    value
  end
end
