defmodule GnatStreaming.MixProject do
  use Mix.Project

  def project do
    [
      app: :nats_streaming,
      version: "0.0.2",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [ignore_warnings: ".dialyzer_ignore.exs"],
      description: "BETA support for interacting with a NATS streaming server",
      package: [
        licenses: ["MIT"],
        links: %{"github" => "https://github.com/mmmries/nats.ex_streaming"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gnat, "~> 1.0"},
      {:protobuf, "~> 0.7.1"},
      {:statix, "~> 1.1", only: :dev},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
