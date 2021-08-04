defmodule TeamBudged.Invites.Core.CreateInvite do
  alias TeamBudged.Invites.Data.Invite
  alias TeamBudged.Accounts.Core.UserRepo
  alias TeamBudged.Members.Core.MemberRepo
  alias TeamBudged.Members.Data.Member

  def perform(invite, current_user, team) do
    invite
    |> Enum.map(fn invite ->
      user_invited = UserRepo.get_by_email(invite)

      invite = %{
        email: invite,
        user_id: current_user.id,
        team_id: team.id,
        email_has_account: (user_invited != nil && true) || false
      }

      {user_invited, invite}
    end)
    |> Enum.reduce(Ecto.Multi.new(), fn {user, invite}, multi ->
      if user != nil do
        if MemberRepo.user_is_member_from_a_team?(user.id, invite.team_id) do
          multi
        else
          multi
          |> Ecto.Multi.insert("associate_user_team#{user.id}-#{invite.email}", %Member{
            user_id: user.id,
            team_id: invite.team_id
          })
          |> Ecto.Multi.insert("invite:#{invite.email}", invite)
        end
      else
        Ecto.Multi.insert(multi, "invite:#{invite.email}", invite)
      end
    end)
  end
end
