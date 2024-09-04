# config/config.exs
import Config

# General application configuration
config :increment_service,
  ecto_repos: [IncrementService.Repo]

# Configures the endpoint
config :increment_service, IncrementServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YOUR_SECRET_KEY_BASE",
  # render_errors: [view: IncrementServiceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: IncrementService.PubSub,
  live_view: [signing_salt: "YOUR_SIGNING_SALT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
