defmodule SocialPhoenixWeb.Router do
  use SocialPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SocialPhoenixWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SocialPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController 
    post "/users/:id/follow", UserController, :follow, as: :follow
    delete "/users/:id/unfollow", UserController, :unfollow, as: :follow
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SocialPhoenixWeb do
  #   pipe_through :api
  # end
end
