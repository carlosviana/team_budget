defmodule TeamBudged.Teams do
  alias TeamBudged.Teams.Core.TeamRepo

  def list_teams(user_id) do
    TeamRepo.list_teams(user_id)
  end

end
