defmodule SocialPhoenix.Accounts.Follower do
  use Ecto.Schema
  import Ecto.Changeset


  schema "followers" do
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(follower, attrs) do
    follower
    |> cast(attrs, [])
    |> validate_required([])
  end
end
