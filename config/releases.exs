# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :team_budged, TeamBudged.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "2")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :team_budged, TeamBudged.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: System.get_env("SMTP_HOST"),
  hostname: System.get_env("SMTP_HOST"),
  port: System.get_env("SMTP_PORT"),
  # or {:system, "SMTP_USERNAME"}
  username: System.get_env("SMTP_USER"),
  # or {:system, "SMTP_PASSWORD"}
  password: System.get_env("SMTP_PASSWORD"),
  # can be `:always` or `:never`
  tls: :if_available,
  # or {:system, "ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
  allowed_tls_versions: [:tlsv1, :"tlsv1.1", :"tlsv1.2"],
  tls_log_level: :error,
  # optional, can be `:verify_peer` or `:verify_none`
  tls_verify: :verify_peer,
  # optional, path to the ca truststore
  tls_cacertfile: "/somewhere/on/disk",
  # optional, DER-encoded trusted certificates
  tls_cacerts: "…",
  # optional, tls certificate chain depth
  tls_depth: 3,
  # optional, tls verification function
  tls_verify_fun: {&:ssl_verify_hostname.verify_fun/3, check_hostname: "example.com"},
  # can be `true`
  ssl: false,
  retries: 1,
  # can be `true`
  no_mx_lookups: false,
  # can be `:always`. If your smtp relay requires authentication set it to `:always`.
  auth: :cram_md5

config :team_budged, TeamBudgedWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
config :team_budged, TeamBudgedWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
