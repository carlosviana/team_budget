defmodule TeamBudgedGraphql.Types do
  use Absinthe.Schema.Notation
  alias TeamBudgedGraphql.Types

  import_types(Types.Session)
  import_types(Types.User)
end
