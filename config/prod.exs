# config/prod.exs
import Config

# Configure your database for production
config :increment_service, IncrementService.Repo,
  username: "postgres",
  password: "postgres",
  database: "increment_service_prod",
  hostname: "localhost",
  pool_size: 15

config :increment_service, IncrementServiceWeb.Endpoint,
  http: [port: 3333],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Application.spec(:increment_service, :vsn)

# Do not print debug messages in production
config :logger, level: :info

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
