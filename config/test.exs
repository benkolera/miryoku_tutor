import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :typing_tutor, TypingTutorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "DzATyY9tcBmqZWMXRpE0y9XNZJp+CtisfhPB0O9BKgiVX8p92F6f3DHDn6PQa9T4",
  server: false

# In test we don't send emails.
config :typing_tutor, TypingTutor.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
