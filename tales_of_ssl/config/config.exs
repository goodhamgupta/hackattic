import Config

config :tales_of_ssl,
  token: File.read!("../credentials.txt") |> String.trim()
