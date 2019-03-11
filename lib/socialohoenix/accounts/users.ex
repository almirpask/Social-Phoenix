defmodule Socialohoenix.Accounts.Users do
  use Ecto.Schema
  import Ecto.Changeset


  schema "user" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_lenght(:username, min: 1, max: 20)
  end

  # def registration_changeset(user, params) do
  #   user
  #   |> changeset(user)
  #   |> cast_assoc()
  # end
end
