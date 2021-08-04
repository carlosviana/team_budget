alias TeamBudged.{Accounts.Data.User, Members.Member, Repo}

{:ok, %{id: user_id, teams: [%{id: team_id} | _]}} =
  %{
    first_name: "Gustavo",
    last_name: "Oliveira",
    email: "gusta@gmail.com",
    password: "123123",
    password_confirmation: "123123",
    teams: [
      %{name: "elxpro graphql", description: "learn graphql"}
    ]
  }
  |> User.changeset()
  |> Repo.insert()

%Member{user_id: user_id, team_id: team_id}
|> Repo.insert()

%{
  first_name: "Carlos",
  last_name: "Viana",
  email: "viana@gmail.com",
  password: "123123",
  password_confirmation: "123123"
}
|> User.changeset()
|> Repo.insert()
