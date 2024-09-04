
defmodule IncrementServiceWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :increment_service

  # Set up request parsing and logging
  plug Plug.RequestId
  plug Plug.Logger

  # Parsers for JSON requests
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug IncrementServiceWeb.Router
end
