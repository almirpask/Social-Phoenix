defmodule SocialPhoenix.Publications.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comments" do
    field :body, :string
    field :user_id, :id
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
