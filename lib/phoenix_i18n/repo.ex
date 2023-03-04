defmodule PhoenixI18n.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_i18n,
    adapter: Ecto.Adapters.Postgres
end
