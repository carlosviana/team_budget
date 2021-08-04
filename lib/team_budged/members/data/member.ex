defmodule TeamBudged.Members.Data.Member do
  use Ecto.Schema
  import Ecto.Changeset

  alias TeamBudged.Accounts.Data.User
  alias TeamBudged.Teams.Data.Team

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "members" do
    belongs_to :user, User
    belongs_to :team, Team

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [])
    |> validate_required([])
  end
end
