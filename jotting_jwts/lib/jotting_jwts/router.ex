defmodule JottingJwts.Router do
  require Logger
  use Plug.Router

  # plug(Plug.Parsers, parsers: [:json], json_decoder: Poison, paths: ["/"])
  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["text/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)
  plug(Plug.Logger, log: :debug)

  get "/" do
    send_resp(conn, 200, "Hello")
  end

  post "/" do
    JottingJwts.ConcatenatePlug.call(conn, opts)
  end

  match _ do
    send_resp(conn, 404, "Oops. Page not found")
  end
end
