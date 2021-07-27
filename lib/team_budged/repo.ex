defmodule TeamBudged.Repo do
  use Ecto.Repo,
    otp_app: :team_budged,
    adapter: Ecto.Adapters.Postgres
end
