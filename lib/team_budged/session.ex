defmodule TeamBudged.Session do
  alias TeamBudged.Accounts.Core.Session

  def login(user) do
    Session.login(user)
  end
end
