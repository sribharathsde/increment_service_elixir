defmodule IncrementService.Application do
  use Application

  def start(_type, _args) do
    children = [
      IncrementService.Repo,
      IncrementServiceWeb.Endpoint,
      # Add the StateStore to the supervision tree
      {IncrementService.StateStore, []}
    ]

    opts = [strategy: :one_for_one, name: IncrementService.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    IncrementServiceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
