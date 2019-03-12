defmodule SocialPhoenixWeb.PageController do
  use SocialPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
