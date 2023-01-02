defmodule ElixirRelease.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirReleaseWeb.Telemetry,
      # Start the Ecto repository
      ElixirRelease.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirRelease.PubSub},
      # Start Finch
      {Finch, name: ElixirRelease.Finch},
      # Start the Endpoint (http/https)
      ElixirReleaseWeb.Endpoint
      # Start a worker by calling: ElixirRelease.Worker.start_link(arg)
      # {ElixirRelease.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirRelease.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirReleaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
