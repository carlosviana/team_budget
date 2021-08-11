defmodule TeamBudged.Repo.Migrations.CreatePermissions do
  use Ecto.Migration

  def change do
    create table(:permissions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :slug, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:permissions, [:name])
    create unique_index(:permissions, [:slug])
  end
end
