defmodule SocialohoenixWeb.PageController do
  use SocialohoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
