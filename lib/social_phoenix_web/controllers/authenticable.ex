defmodule SocialPhoenixWeb.Authenticable do
    import Plug.Conn
    import SocialPhoenixWeb.Router.Helpers
    import Phoenix.Controller
    
    alias SocialPhoenix.Accounts
    def init(opts), do: opts

    def call(conn, _opts) do
        if conn.assigns.current_user do
            user_id = get_session(conn, :user_id)
            user = user_id && Accounts.get_user!(user_id)
            assign(conn, :current_user, user)
            conn
        else
            conn
            |> put_flash(:error, "You must be logged in to access that page")
            |> redirect(to: page_path(conn, :index))
            |> halt()
        end
    end
end