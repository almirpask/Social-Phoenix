defmodule SocialPhoenix.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias SocialPhoenix.Accounts.User
  alias SocialPhoenix.Repo

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

  alias SocialPhoenix.Accounts.Follower

  @doc """
  Returns the list of followers.

  ## Examples

      iex> list_followers()
      [%Follower{}, ...]

  """
  def list_followers do
    Repo.all(Follower)
  end

  @doc """
  Gets a single follower.

  Raises `Ecto.NoResultsError` if the Follower does not exist.

  ## Examples

      iex> get_follower!(123)
      %Follower{}

      iex> get_follower!(456)
      ** (Ecto.NoResultsError)

  """
  def get_follower!(id), do: Repo.get!(Follower, id)

  @doc """
  Creates a follower.

  ## Examples

      iex> create_follower(%{field: value})
      {:ok, %Follower{}}

      iex> create_follower(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_follower(attrs \\ %{}) do
    %Follower{}
    |> Follower.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a follower.

  ## Examples

      iex> update_follower(follower, %{field: new_value})
      {:ok, %Follower{}}

      iex> update_follower(follower, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_follower(%Follower{} = follower, attrs) do
    follower
    |> Follower.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Follower.

  ## Examples

      iex> delete_follower(follower)
      {:ok, %Follower{}}

      iex> delete_follower(follower)
      {:error, %Ecto.Changeset{}}

  """
  def delete_follower(%Follower{} = follower) do
    Repo.delete(follower)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking follower changes.

  ## Examples

      iex> change_follower(follower)
      %Ecto.Changeset{source: %Follower{}}

  """
  def change_follower(%Follower{} = follower) do
    Follower.changeset(follower, %{})
  end
end
