alias TeamBudged.{Accounts.User, Repo}

%{
  first_name: "Gustavo",
  last_name: "Oliveira",
  email: "gusta@gmail.com",
  password: "123123",
  password_confirmation: "123123"
}
|> User.changeset()
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
