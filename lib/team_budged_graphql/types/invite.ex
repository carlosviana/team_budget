defmodule TeamBudgedGraphql.Types.Invite do
  use Absinthe.Schema.Notation

  object :invite do
    field :id, :string
    field :team_id, :string
    field :user_id, :string
    field :email, :string
    field :email_has_account, :boolean
  end
end
