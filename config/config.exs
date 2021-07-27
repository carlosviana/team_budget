# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :team_budged,
  ecto_repos: [TeamBudged.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :team_budged, TeamBudgedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9p4sDHAZIKGt+3SCVFwZHQy0fXxYcjzGkCn1Nm1F1z2UN04l4iYhMIX5G4lliFuY",
  render_errors: [view: TeamBudgedWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TeamBudged.PubSub,
  live_view: [signing_salt: "eefx8G7h"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
