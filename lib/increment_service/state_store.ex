defmodule IncrementService.StateStore do
  use GenServer

  @sync_interval 10_000

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    schedule_sync()
    {:ok, state}
  end

  def handle_call({:increment, key, value}, _from, state) do
    new_state = Map.update(state, key, value, &(&1 + value))
    {:reply, :ok, new_state}
  end

  def handle_info(:sync, state) do
    new_state = sync_to_postgres(state)
    schedule_sync()
    {:noreply, new_state} # Replace old state with the cleared state
  end

  defp schedule_sync do
    Process.send_after(self(), :sync, @sync_interval)
  end

  # Sync data to the DB and clear the state
  defp sync_to_postgres(state) do
    Enum.each(state, fn {key, value} ->
      case IncrementService.Repo.get_by(IncrementService.KeyValue, key: key) do
        nil ->
          IncrementService.Repo.insert!(%IncrementService.KeyValue{key: key, value: value})
        record ->
          IncrementService.Repo.update!(Ecto.Changeset.change(record, value: record.value + value))
      end
    end)

    # Return an empty map after syncing to the database
    %{}
  end
end
