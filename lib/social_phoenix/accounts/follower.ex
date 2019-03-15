defmodule SocialPhoenix.Accounts.Follower do
  use Ecto.Schema
  import Ecto.Changeset


  schema "followers" do
    field :user_id, :id
    field :follower_id, :id
    timestamps()
  end

  @doc false
  def changeset(follower, attrs) do
    follower
    |> cast(attrs, [:user_id, :follower_id])
    |> validate_required([:user_id, :follower_id])
  end
end
