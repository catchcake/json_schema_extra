defmodule JSONSchemaExtra.MixProject do
  use Mix.Project

  @version "0.1.0"
  def project do
    [
      aliases: aliases(),
      app: :json_schema_extra,
      description: "An extra function for JSON Schema",
      dialyzer: dialyzer(),
      docs: docs(),
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/catchcake/json_schema_extra",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      version: @version
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Private

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test]},
      {:dialyxir, "~> 1.2", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.29", only: :dev},
      {:ex_json_schema, "~> 0.10"},
      {:excoveralls, "~> 0.15", only: [:dev, :test]},
      {:result, "~> 1.7"},
      {:stream_data, "~> 0.5", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      maintainers: [
        "Jindrich K. Smitka <smitka.j@gmail.com>",
        "Daniel Bultas <comm3net@gmail.com>"
      ],
      licenses: ["Private"],
      links: %{
        "GitHub" => "https://github.com/catchcake/json_schema_extra"
      }
    ]
  end

  defp aliases() do
    []
  end

  defp dialyzer() do
    [
      plt_add_apps: [:mix, :ex_unit],
      plt_core_path: "_build/#{Mix.env()}",
      ignore_warnings: "dialyzer.ignore-warnings",
      flags: [
        :error_handling,
        :no_opaque
      ]
    ]
  end

  defp docs() do
    [
      source_ref: "v#{@version}",
      canonical: "https://catchcake.hexdocs.pm/json_schema_extra",
      main: "readme",
      extras: ["README.md"],
      groups_for_extras: [
        Introduction: ~r/README.md/
      ]
    ]
  end
end
