defmodule TeamBudgedGraphql.Resolvers.SessionResolver do
  alias TeamBudged.Session

  def login(_, %{user: user}, _) do
    Session.login(user)
  end
end
