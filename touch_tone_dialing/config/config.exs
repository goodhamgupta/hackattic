import Config

config :touch_tone_dialing,
  token: File.read!("../credentials.txt") |> String.trim()
