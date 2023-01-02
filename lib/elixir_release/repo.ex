defmodule ElixirRelease.Repo do
  use Ecto.Repo,
    otp_app: :elixir_release,
    adapter: Ecto.Adapters.Postgres
end
