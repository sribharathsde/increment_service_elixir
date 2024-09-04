# config/dev.exs
import Config

# Configure your database
config :increment_service, IncrementService.Repo,
  username: "admin",
  password: "password",
  database: "increment_service_elixr-db-1",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
config :increment_service, IncrementServiceWeb.Endpoint,
  http: [port: 3333],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
