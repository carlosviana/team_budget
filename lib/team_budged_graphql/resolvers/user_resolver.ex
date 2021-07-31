defmodule TeamBudgedGraphql.Resolvers.UserResolver do
  alias TeamBudged.Accounts

  def list_users(_parent, _params, _resolutions) do
    {:ok, Accounts.list_users()}
  end
end
