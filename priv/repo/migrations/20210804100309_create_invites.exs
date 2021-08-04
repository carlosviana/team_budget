defmodule TeamBudged.Repo.Migrations.CreateInvites do
  use Ecto.Migration

  def change do
    create table(:invites, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :email_has_account, :boolean, default: false, null: false

      add :user_id,
          references(:users, on_delete: :delete_all, on_update: :update_all, type: :binary_id)

      add :team_id,
          references(:teams, on_delete: :delete_all, on_update: :update_all, type: :binary_id)

      timestamps()
    end

    create index(:invites, [:user_id])
    create index(:invites, [:team_id])
  end
end
