alias TeamBudged.{Accounts.User, Repo}

%{first_name: "Gustavo", last_name: "Oliveira", email: "gusta@gmail.com", password_hash: "123123"}
|> User.changeset()
|> Repo.insert()
