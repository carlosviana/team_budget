defmodule TeamBudgedGraphql.Plugs.TeamContext do
  @behaviour Plug
  import Plug.Conn

  alias TeamBudged.Teams.Core.TeamRepo

  def init(opts), do: opts

  def call(conn, _) do
    case is_there_user_in_to_context?(conn) do
      nil ->
        Absinthe.Plug.put_options(conn, context: %{})

      current_user ->
        context = conn
        |> get_req_header("team")
        |> get_slug()
        |> get_team(current_user)

        Absinthe.Plug.put_options(conn, context: context)
      end
    end

    defp get_slug([]), do: nil
    defp get_slug([slug | _]), do: slug

    defp get_team(nil, current_user) do
      %{current_user: current_user}
    end

    defp get_team(slug, current_user) do
      IO.inspect(current_user)
      team = TeamRepo.get_team_by_user_and_slug(current_user.id, slug)
      IO.inspect(team)
    %{current_user: current_user, team: team}
  end

  defp is_there_user_in_to_context?(conn) do
    Map.get(conn.private[:absinthe].context, :current_user)
  end
end
