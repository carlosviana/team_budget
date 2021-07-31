defmodule TeamBudgedGraphql.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :role, :string
  end
end
