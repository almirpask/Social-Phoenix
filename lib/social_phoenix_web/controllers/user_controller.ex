defmodule SocialPhoenixWeb.UserController do
    use SocialPhoenixWeb, :controller
    alias SocialPhoenix.Accounts
    alias SocialPhoenix.Accounts.User
    plug :authenticate when action in [:index, :show]

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
                |> SocialPhoenixWeb.Auth.login(user)
                |> put_flash(:info, "#{user.name} created!")
                |> redirect(to: Routes.user_path(conn, :index))
            {:error, %Ecto.Changeset{} = changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end

    defp authenticate(conn, _opts) do
        if conn.assigns.current_user do
          conn
        else
          conn
          |> put_flash(:error, "You must be logged in to access that page")
          |> redirect(to: Routes.page_path(conn, :index))
          |> halt()
        end
    end
end
