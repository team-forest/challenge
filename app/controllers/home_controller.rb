class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @graph = Koala::Facebook::API.new(current_user.token)
    @friends = @graph.get_connections("me", "friends")
  end

	def challenge
		challengeStatus(params[:status])
	end


  def get_friend_list
  end
end
