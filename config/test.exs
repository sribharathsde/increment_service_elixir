# config/test.exs
import Config

# Configure your database for testing
config :increment_service, IncrementService.Repo,
  username: "postgres",
  password: "postgres",
  database: "increment_service_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure the Phoenix endpoint for testing
config :increment_service, IncrementServiceWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
