class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @challenges = current_user.challenges
	  @graph = Koala::Facebook::API.new(current_user.token)
    @friends = @graph.get_connections("me", "friends")
  end
end
