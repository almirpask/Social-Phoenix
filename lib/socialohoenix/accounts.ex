defmodule Socialohoenix.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Socialohoenix.Accounts.User
  alias Socialohoenix.Repo

  def get_user_by_email(email) do
    from(user in User, where: user.email == ^email)
    |> Repo.one()
  end

  def authenticate_by_email_and_pass(email, given_pass) do
    user = get_user_by_email(email)
    cond do
      user && Comeonin.Pbkdf2.checkpw(given_pass, user.password) -> 
        {:ok, user}
      user ->
        {:error, :unauthorized}
      true -> 
        Comeonin.Pbkdf2.dummy_checkpw()
        {:error, :not_found}
    end
  end

  @doc """
  Returns the list of user.

  ## Examples

      iex> list_user()
      [%User{}, ...]

  """
  def list_user do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_users!(123)
      %User{}

      iex> get_users!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_users(%{field: value})
      {:ok, %User{}}

      iex> create_users(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_users(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_users(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_users(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end


  def change_registration(%User{} = user, params) do
    User.changeset(user, params)
  end

  def register_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end


  @doc """
  Deletes a User.

  ## Examples

      iex> delete_users(user)
      {:ok, %User{}}

      iex> delete_users(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_users(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_users(%User{} = user) do
    User.changeset(user, %{})
  end
end
