defmodule TeamBudged.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :description, :string, null: false
      add :slug, :string, null: false
      add :budget, :decimal, precision: 10, scale: 2, default: 0

      add :team_id,
          references(:teams, on_delete: :delete_all, on_update: :update_all, type: :binary_id)

      timestamps()
    end

    create unique_index(:projects, [:name])
    create unique_index(:projects, [:slug])
    create index(:projects, [:team_id])
  end
end
