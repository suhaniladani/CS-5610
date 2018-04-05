use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :tasktracker3, Tasktracker3Web.Endpoint,
  secret_key_base: "wZQN+ajuVEoCVKl8aEEwZS0Cm8CTLtoxX0qHp8KrpgGZtfexzZQ11e3Mts6S5m5a"

# Configure your database
config :tasktracker3, Tasktracker3.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tasktracker3_prod",
  pool_size: 15
