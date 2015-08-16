class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @challenges = current_user.challenges
  	logger.info @challenges
  end
end
