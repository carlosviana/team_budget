defmodule TeamBudged.Invites do
  alias TeamBudged.Invites.Core.CreateInvite

  def send_invite(invites, current_user, team) do
    invites = CreateInvite.perform(invites, current_user, team)
    invites
  end
end
