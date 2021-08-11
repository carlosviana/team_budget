defmodule TeamBudgedGraphql.Types.Role do
  use Absinthe.Schema.Notation

  object :role do
    field :id, :string
    field :description, :string
    field :name, :string
    field :slug, :string
  end

  input_object :role_input do
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :slug, non_null(:string)
  end
end
