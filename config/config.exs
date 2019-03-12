# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :social_phoenix,
  ecto_repos: [SocialPhoenix.Repo]

# Configures the endpoint
config :social_phoenix, SocialPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5reQX6nfva7LBviAjSkXU6nEQIPDIXeOwWmMzBO6q0PHv/4p4+EF0PXkf02YdF1l",
  render_errors: [view: SocialPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SocialPhoenix.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
