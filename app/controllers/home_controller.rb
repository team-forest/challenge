class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @graph = Koala::Facebook::API.new(current_user.token)
    @friends = @graph.get_connections("me", "friends")
  end

	def challenge
		challengeStatus(params[:status])
	end


  def cChallenge
    Challenge.addChallenge(params,current_user.id)
    redirect_to challenge_list_path
  end

  def get_friend_list
  end
end
