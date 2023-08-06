import Config

config :collision_course,
  token: File.read!("../credentials.txt") |> String.trim()
