defmodule TeamBudged.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :slug, :string, null: false
      add :description, :string
      add :user_id, references(:users, on_delete: :delete_all, on_update: :update_all, type: :binary_id), null: false

      timestamps()
    end

    create unique_index(:teams, [:name])
    create unique_index(:teams, [:slug])
    create index(:teams, [:user_id])
  end
end
