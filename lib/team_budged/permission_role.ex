defmodule TeamBudged.PermissionRole do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "permission_role" do
    field :permission_id, :binary_id
    field :role_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(permission_role, attrs) do
    permission_role
    |> cast(attrs, [])
    |> validate_required([])
  end
end
