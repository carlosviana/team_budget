defmodule TeamBudged.Accounts do
  alias TeamBudged.Accounts.User
  alias TeamBudged.Repo

  def list_users() do
    Repo.all(User)
  end

  def create_user(user) do
    user
    |> User.changeset()
    |> Repo.insert()
  end
end
