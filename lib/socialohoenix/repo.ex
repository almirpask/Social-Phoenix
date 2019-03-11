defmodule Socialohoenix.Repo do
  use Ecto.Repo,
    otp_app: :socialohoenix,
    adapter: Ecto.Adapters.Postgres
end
