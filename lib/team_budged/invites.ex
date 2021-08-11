defmodule TeamBudged.Invites do
  alias TeamBudged.Invites.Core.CreateInvite
  alias TeamBudged.Invites.Server.SendEmail

  def send_invite(invites, current_user, team) do
    invites = CreateInvite.perform(invites, current_user, team)

    SendEmail.perform(invites)

    invites
  end
end
