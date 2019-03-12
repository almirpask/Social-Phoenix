defmodule SocialPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :social_phoenix,
    adapter: Ecto.Adapters.Postgres
end
