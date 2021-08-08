defmodule TeamBudgedGraphql.Types.Project do
  use Absinthe.Schema.Notation

  object :project do
    field :id, :string
    field :budget, :string
    field :description, :string
    field :name, :string
    field :slug, :string
  end

  input_object :project_input do
    field :budget, non_null(:string)
    field :description, non_null(:string)
    field :name, non_null(:string)
  end
end
