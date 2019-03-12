defmodule SocialohoenixWeb.UserController do
    use SocialohoenixWeb, :controller
    alias Socialohoenix.Accounts
    alias Socialohoenix.Accounts.User
  
    def index(conn, _params) do
        users = Accounts.list_user()
        render(conn, "index.html", users: users)
    end

    def new(conn, _params) do
        changeset = Accounts.change_registration(%User{}, %{})
        render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"user" => user_params}) do
        case Accounts.create_user(user_params) do
            {:ok, user} -> 
                conn
                |> put_flash(:info, "#{user.name} created!")
                |> redirect(to: Routes.user_path(conn, :index))
            {:error, %Ecto.Changeset{} = changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end
end
