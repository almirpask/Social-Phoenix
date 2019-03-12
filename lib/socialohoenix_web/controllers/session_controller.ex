defmodule SocialohoenixWeb.SessionController do
    use SocialohoenixWeb, :controller

    def new(conn, _) do
        render(conn, "new.html")
    end

    def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
        case SocialohoenixWeb.Auth.login_by_email_and_pass(conn, email, pass) do
            {:ok, conn} ->
                conn
                |> put_flash(:info, "Welcome back!")
                |> redirect(to: Routes.page_path(conn, :index))
            {:error, _reason, conn } ->
                conn
                |> put_flash(:error, "Invalid email/password combination")
                |> render("new.html")
        end
    end

    def delete(conn, _) do
        conn
        |> SocialohoenixWeb.Auth.logout()
        |> redirect(to: Routes.page_path(conn, :index))
        
    end
end