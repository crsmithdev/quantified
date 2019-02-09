defmodule Quantified.MixProject do
  use Mix.Project

  def project do
    [
      app: :quantified,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :poison],
      mod: {Quantified.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:plug, "~> 1.5"},
      {:plug_cowboy, "~> 1.0"},
      {:poison, "~> 3.1"}
    ]
  end
end
