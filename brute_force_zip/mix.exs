defmodule Unpack.Mixfile do
  use Mix.Project

  def project do
    [
      app: :brute_force_zip,
      version: "0.0.1",
      elixir: "~> 1.14",
      deps: deps()
    ]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:req, "~> 0.3.0"}
    ]
  end
end
