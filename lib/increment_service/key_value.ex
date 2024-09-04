
defmodule IncrementService.KeyValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "key_values" do
    field :key, :string
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(key_value, attrs) do
    key_value
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
