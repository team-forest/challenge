class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
	@status = params[:status]
  end
end
