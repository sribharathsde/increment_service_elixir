
defmodule IncrementService.Repo.Migrations.CreateKeyValues do
  use Ecto.Migration

  def change do
    create table(:key_values) do
      add :key, :string
      add :value, :integer, default: 0
      timestamps()
    end

    create unique_index(:key_values, [:key])
  end
end
    