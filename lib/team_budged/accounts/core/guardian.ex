defmodule TeamBudged.Accounts.Core.Guardian do
  use Guardian, otp_app: :team_budged
  alias TeamBudged.Accounts.Core.UserRepo

  def subject_for_token(user, _claims), do: {:ok, user.id}
  def resource_from_claims(%{"sub" => id}), do: {:ok, UserRepo.get_user(id)}
  def resource_from_claims(_), do: {:error, :resource_not_found}
  def sign(user), do: Guardian.encode_and_sign(__MODULE__, user)
  def verify(token), do: Guardian.decode_and_verify(__MODULE__, token)
end
