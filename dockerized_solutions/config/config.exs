import Config

config :dockerized_solutions,
  token: File.read!("../credentials.txt") |> String.trim()
