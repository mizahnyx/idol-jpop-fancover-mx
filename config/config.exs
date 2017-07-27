# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :idol_jpop_fancover_mx,
  ecto_repos: [IdolJpopFancoverMx.Repo]

# Configures the endpoint
config :idol_jpop_fancover_mx, IdolJpopFancoverMx.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KyepzBumhxSsvCL7wEhtv2YNdUWVq68mjgsGEleBUGVvvAf9budTI41sLsK+S+bO",
  render_errors: [view: IdolJpopFancoverMx.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IdolJpopFancoverMx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Ueberauth  
config :ueberauth, Ueberauth,
  providers: [
    facebook: {Ueberauth.Strategy.Facebook, []}
  ]
  
config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")
  
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
