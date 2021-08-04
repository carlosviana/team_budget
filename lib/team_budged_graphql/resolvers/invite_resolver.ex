defmodule TeamBudgedGraphql.Resolvers.InviteResolver do
  alias TeamBudged.Invites

  def send_invite(_parent, %{invites: invites}, %{
        context: %{current_user: current_user, team: team}
      }) do
    Invites.send_invite(invites, current_user, team)
  end
end
