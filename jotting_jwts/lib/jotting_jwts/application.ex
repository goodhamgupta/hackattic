defmodule JottingJwts.Application do
  use Application

  require Logger

  @table :signer_table

  def start(_type, _args) do
    children = [
      {
        Plug.Cowboy,
        scheme: :http, plug: JottingJwts.Router, options: [port: http_port()]
      }
    ]

    # Obtain jwt
    jwt_secret = JottingJwts.get_jwt_secret()
    signer = Joken.Signer.create("HS256", jwt_secret)

    # create ets table
    create_table()

    # Cache signer
    :ets.insert(@table, {:signer, signer})
    Logger.info("Stored signer in ETS")

    opts = [strategy: :one_for_one, name: JottingJwts.Supervisor]

    Logger.info("Starting application...")

    resp = Supervisor.start_link(children, opts)

    JottingJwts.submit_url()

    resp
  end

  defp http_port do
    Application.get_env(:jotting_jwts, :cowboy_port, 8080)
  end

  defp create_table do
    :ets.new(@table, [:set, :protected, :named_table])
  end
end
