
defmodule IncrementServiceWeb.IncrementControllerTest do
  use IncrementServiceWeb.ConnCase, async: true

  test "increments key via /increment endpoint", %{conn: conn} do
    conn = post(conn, "/increment", %{"key" => "test", "value" => 5})
    assert conn.status == 202

    conn = post(conn, "/increment", %{"key" => "test", "value" => 3})
    assert conn.status == 202

    state = :sys.get_state(IncrementService.StateStore)
    assert state["test"] == 8
  end
end
    