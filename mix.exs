
defmodule IncrementService.MixProject do
  use Mix.Project

  def project do
    [
      app: :increment_service,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {IncrementService.Application, []}
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.6"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:redix, ">= 0.0.0"},
      {:jason, ">= 1.0.0"}, # Add this line for JSON encoding
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
