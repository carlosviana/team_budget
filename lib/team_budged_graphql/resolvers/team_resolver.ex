defmodule TeamBudgedGraphql.Resolvers.TeamResolver do
  alias TeamBudged.Teams.Core.TeamRepo

  def list_teams(_parent, _params, %{context: %{current_user: %{id: user_id}}}) do
    {:ok, TeamRepo.list_teams(user_id)}
  end
end
