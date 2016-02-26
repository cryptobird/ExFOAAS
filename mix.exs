defmodule Exfoaas.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exfoaas,
      version: "0.0.2",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      description: "brings the utility of FOAAS to elixir.",
      package: package
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo,     "~> 0.3", only: [:dev, :test]},
      {:poison,    "~> 2.0"},
      {:httpoison, "~> 0.8.0"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end

  def package do
    [
      maintainers: ["Ethan Parrott"],
      licenses: ["WTFPL"],
      links: %{"GitHub" => "https://github.com/cryptobird/ExFOAAS.git"}
    ]
  end
end
