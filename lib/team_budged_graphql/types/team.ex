defmodule TeamBudgedGraphql.Types.Team do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers

  alias TeamBudged.Teams.Data.Team

  object :team do
    field :id, :string
    field :name, :string
    field :description, :string
    field :slug, :string
    field :user_id, :string

    field :user, :user do
      resolve(dataloader(Team))
    end
  end

  input_object :team_input do
    field :name, non_null(:string)
    field :description, non_null(:string)
  end
end
