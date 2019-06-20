class User
  attr_reader :user
  HOOPLA_URL = "users/<id>"
  HOOPLA_TYPE = "user"

  def initialize(user)
    @user = user
  end

  def id
    #binding.pry
    user.href.split("/").last
  end

  def user_url
    HOOPLA_URL.gsub("<id>", id)
  end
end
