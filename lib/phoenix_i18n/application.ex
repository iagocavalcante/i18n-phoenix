defmodule PhoenixI18n.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixI18nWeb.Telemetry,
      # Start the Ecto repository
      PhoenixI18n.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixI18n.PubSub},
      # Start Finch
      {Finch, name: PhoenixI18n.Finch},
      # Start the Endpoint (http/https)
      PhoenixI18nWeb.Endpoint
      # Start a worker by calling: PhoenixI18n.Worker.start_link(arg)
      # {PhoenixI18n.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixI18n.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixI18nWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
