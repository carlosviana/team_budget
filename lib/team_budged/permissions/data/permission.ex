defmodule TeamBudged.Permissions.Data.Permission do
  use Ecto.Schema
  import Ecto.Changeset

  alias TeamBudged.Utils.CreateSlug

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "permissions" do
    field :description, :string
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(permission, attrs) do
    permission
    |> cast(attrs, [:name, :slug, :description])
    |> validate_required([:name, :description])
    |> CreateSlug.perform(:name)
    |> unique_constraint(:name)
    |> unique_constraint(:slug)
  end
end
