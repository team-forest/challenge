class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @challenges = current_user.challenges
  end

  def mark_as_done
    challenge = Challenge.find(params[:id])
    challenge.status = 'done'
    challenge.save
    render nothing: true
  end
end
