
defmodule IncrementServiceWeb.IncrementController do
  use IncrementServiceWeb, :controller

  def increment(conn, %{"key" => key, "value" => value}) when is_integer(value) do
    GenServer.call(IncrementService.StateStore, {:increment, key, value})
    send_resp(conn, 202, "")
  end
end
    