defmodule TeamBudged.Invites.Data.Invite do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "invites" do
    field :email, :string
    field :email_has_account, :boolean, default: false
    field :user_id, :binary_id
    field :team_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(invite, attrs) do
    invite
    |> cast(attrs, [:email, :email_has_account])
    |> validate_required([:email, :email_has_account])
  end
end
