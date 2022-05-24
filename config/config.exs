# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_mon,
  ecto_repos: [ExMon.Repo]

# Configures the endpoint
config :ex_mon, ExMonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nOSyOEvIuMipdSH4wMdtlZ7E07ytoQQqQ7hf/27tYFkIDYnz22vdjyTSIs1lkuTh",
  render_errors: [view: ExMonWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExMon.PubSub,
  live_view: [signing_salt: "iPlaS8Qf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :my_app, ExMonWeb.Auth.Guardian,
       issuer: "ex_mon",
       secret_key: "6Z/Ox55k6sfNOIkzv1GkgpX1XpZVnJQZP6JElY8ho+Uo+E8qB7wfCKZv7JJc3R9h"
