use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :idol_jpop_fancover_mx, IdolJpopFancoverMxWeb.Endpoint,
  http: [port: 8080],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../assets", __DIR__)]]


# Watch static and templates for browser reloading.
config :idol_jpop_fancover_mx, IdolJpopFancoverMxWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/idol_jpop_fancover_mx_web/views/.*(ex)$},
      ~r{lib/idol_jpop_fancover_mx_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :idol_jpop_fancover_mx, IdolJpopFancoverMx.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "idol_jpop_fancover_mx_dev",
  hostname: "localhost",
  template: "template0",
  pool_size: 10
