defmodule SocialPhoenix.AccountsTest do
  use SocialPhoenix.DataCase

  alias SocialPhoenix.Accounts

  describe "user" do
    alias SocialPhoenix.Accounts.Users

    @valid_attrs %{email: "some email", name: "some name", password: "some password"}
    @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password"}
    @invalid_attrs %{email: nil, name: nil, password: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_users()

      users
    end

    test "list_user/0 returns all user" do
      users = users_fixture()
      assert Accounts.list_user() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Accounts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Accounts.create_users(@valid_attrs)
      assert users.email == "some email"
      assert users.name == "some name"
      assert users.password == "some password"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %Users{} = users} = Accounts.update_users(users, @update_attrs)
      assert users.email == "some updated email"
      assert users.name == "some updated name"
      assert users.password == "some updated password"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_users(users, @invalid_attrs)
      assert users == Accounts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_users(users)
    end
  end

  describe "followers" do
    alias SocialPhoenix.Accounts.Follower

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follower_fixture(attrs \\ %{}) do
      {:ok, follower} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_follower()

      follower
    end

    test "list_followers/0 returns all followers" do
      follower = follower_fixture()
      assert Accounts.list_followers() == [follower]
    end

    test "get_follower!/1 returns the follower with given id" do
      follower = follower_fixture()
      assert Accounts.get_follower!(follower.id) == follower
    end

    test "create_follower/1 with valid data creates a follower" do
      assert {:ok, %Follower{} = follower} = Accounts.create_follower(@valid_attrs)
    end

    test "create_follower/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_follower(@invalid_attrs)
    end

    test "update_follower/2 with valid data updates the follower" do
      follower = follower_fixture()
      assert {:ok, %Follower{} = follower} = Accounts.update_follower(follower, @update_attrs)
    end

    test "update_follower/2 with invalid data returns error changeset" do
      follower = follower_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_follower(follower, @invalid_attrs)
      assert follower == Accounts.get_follower!(follower.id)
    end

    test "delete_follower/1 deletes the follower" do
      follower = follower_fixture()
      assert {:ok, %Follower{}} = Accounts.delete_follower(follower)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_follower!(follower.id) end
    end

    test "change_follower/1 returns a follower changeset" do
      follower = follower_fixture()
      assert %Ecto.Changeset{} = Accounts.change_follower(follower)
    end
  end
end
