defmodule SqsDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :sqs_demo,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SqsDemo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_aws, "~> 2.1"},
      {:ex_aws_sqs, "~> 3.3"},
      {:jason, "~> 1.3"},
      {:hackney, "~> 1.9"},
      {:saxy, "~> 1.1"},
      {:broadway_sqs, "~> 0.7"}
    ]
  end
end
