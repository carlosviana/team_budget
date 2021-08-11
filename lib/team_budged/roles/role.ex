defmodule TeamBudged.Roles.Role do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "roles" do
    field :description, :string
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :slug, :description])
    |> validate_required([:name, :slug, :description])
    |> unique_constraint(:name)
    |> unique_constraint(:slug)
  end
end
