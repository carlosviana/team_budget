alias TeamBudged.{Accounts.Data.User, Members.Data.Member, Repo}

{:ok, %{id: user_id, teams: [%{id: team_id} | _]}} =
  %{
    first_name: "Gustavo",
    last_name: "Oliveira",
    email: "gusta@gmail.com",
    password: "123123",
    password_confirmation: "123123",
    teams: [
      %{
        name: "elxpro graphql",
        description: "learn graphql",
        projects: [
          %{
            name: "graphql api finance",
            description: "api to show assets dunring the day",
            budget: Decimal.new("300.000")
          },
          %{
            name: "liveview finance",
            description: "show assets dunring the day",
            budget: Decimal.new("323.000")
          }
        ]
      }
    ]
  }
  |> User.changeset()
  |> Repo.insert()

%Member{user_id: user_id, team_id: team_id}
|> Repo.insert()

{:ok, u2} =
  %{
    first_name: "Carlos",
    last_name: "Viana",
    email: "viana@gmail.com",
    password: "123123",
    password_confirmation: "123123"
  }
  |> User.changeset()
  |> Repo.insert()

%Member{user_id: u2.id, team_id: team_id}
|> Repo.insert()
