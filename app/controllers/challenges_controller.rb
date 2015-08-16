class ChallengesController < ApplicationController
  before_filter :authenticate_user!

  def index
	  @graph = Koala::Facebook::API.new(current_user.token)
    @friends = @graph.get_connections("me", "friends")
    render json: @friends
    @modal = true
  end

  def new
    # show modal
  end

  def create
    challenge = Challenge.new(user_id: current_user.id, name: params[:name], exp: params[:exp])

    if challenge.save
      flash[:notice] = "Challenge created successfuly"
    else
      flash[:error] = "Unable to create a challenge"
    end
    redirect_to :index
  end
end
