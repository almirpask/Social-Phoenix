defmodule SocialPhoenixWeb.UserView do
  use SocialPhoenixWeb, :view
  import Ecto.Query, warn: false
  alias SocialPhoenix.Repo
  alias SocialPhoenix.Accounts.Follower
  
  
  def count_followers(user) do
    from( f in Follower, where: ^user.id == f.user_id)
    |> Repo.aggregate(:count, :id)
  end

  def following?(user) do    
    from( f in Follower, where: ^user.id == f.follower_id)
    |> Repo.aggregate(:count, :id)
    |> case do
      1 -> true
      0 -> false
    end
  end
end
