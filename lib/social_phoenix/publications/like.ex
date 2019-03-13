defmodule SocialPhoenix.Publications.Like do
  use Ecto.Schema
  import Ecto.Changeset


  schema "likes" do
    field :user_id, :id
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(like, attrs) do
    like
    |> cast(attrs, [])
    |> validate_required([])
  end
end
