# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :amparo,
  ecto_repos: [Amparo.Repo]

# Configures the endpoint
config :amparo, AmparoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aoB9Lopi0oT1gZDsLzk49StOBy1v+2fH9JRI9+PYVhuNk/BfCFUJh2MHElmTmQnu",
  render_errors: [view: AmparoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Amparo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :template_engines,
  drab: Drab.Live.Engine

config :drab,
  main_phoenix_app: :amparo,
  endpoint: Elixir.AmparoWeb.Endpoint,
  pubsub: Elixir.Amparo.PubSub
