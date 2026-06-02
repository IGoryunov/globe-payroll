defmodule GlobePayroll.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GlobePayrollWeb.Telemetry,
      GlobePayroll.Repo,
      {DNSCluster, query: Application.get_env(:globe_payroll, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GlobePayroll.PubSub},
      # Start a worker by calling: GlobePayroll.Worker.start_link(arg)
      # {GlobePayroll.Worker, arg},
      # Start to serve requests, typically the last entry
      GlobePayrollWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GlobePayroll.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GlobePayrollWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
