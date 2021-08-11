defmodule TeamBudged.Repo.Migrations.CreatePermissionRole do
  use Ecto.Migration

  def change do
    create table(:permission_role, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :permission_id,
          references(:permissions,
            on_delete: :delete_all,
            on_update: :update_all,
            type: :binary_id
          ),
          null: false

      add :role_id,
          references(:roles, on_delete: :delete_all, on_update: :update_all, type: :binary_id),
          null: false

      timestamps()
    end

    create index(:permission_role, [:permission_id])
    create index(:permission_role, [:role_id])
  end
end
