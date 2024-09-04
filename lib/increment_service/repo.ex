
defmodule IncrementService.Repo do
  use Ecto.Repo,
    otp_app: :increment_service,
    adapter: Ecto.Adapters.Postgres
end
