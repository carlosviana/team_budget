defmodule TeamBudged.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :role, :string, deafult: "user"
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
