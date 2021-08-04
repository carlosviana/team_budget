defmodule TeamBudgedGraphql.Schema do
  use Absinthe.Schema

  alias TeamBudged.Teams.Data.Team
  alias TeamBudgedGraphql.Resolvers
  alias TeamBudgedGraphql.Middleware

  import_types(TeamBudgedGraphql.Types)

  import AbsintheErrorPayload.Payload
  import_types(AbsintheErrorPayload.ValidationMessageTypes)

  payload_object(:user_payload, :user)
  payload_object(:login_payload, :session)

  query do
    @desc "Get list of all users"
    field :list_users, list_of(:user) do
      middleware(Middleware.Authorize, :user)
      resolve(&Resolvers.UserResolver.list_users/3)
    end
    @desc "Get list of all teams from an user"
    field :list_teams, list_of(:team) do
      middleware(Middleware.Authorize, :user)
      resolve(&Resolvers.TeamResolver.list_teams/3)
    end
  end

  mutation do
    @desc "Create a new user"
    field :create_user, :user_payload do
      arg(:user, non_null(:user_input))
      resolve(&Resolvers.UserResolver.create_user/3)
      middleware(&build_payload/2)
    end

    @desc "Login with a User and then return a JWT token"
    field :login, :login_payload do
      arg(:user, non_null(:login_input))
      resolve(&Resolvers.SessionResolver.login/3)
      middleware(&build_payload/2)
    end
  end

  def context(context) do
    loader = Dataloader.new()
    |> Dataloader.add_source(Team, Team.data())
    Map.put(context, :loader, loader)
  end

  def plugins, do: [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
end
