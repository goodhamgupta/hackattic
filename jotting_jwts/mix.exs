defmodule JottingJwts.MixProject do
  use Mix.Project

  def project do
    [
      app: :jotting_jwts,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {JottingJwts.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:joken, "~> 2.5"},
      {:req, "~> 0.3.0"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 5.0"}
    ]
  end
end
