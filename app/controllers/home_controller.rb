class HomeController < ApplicationController

	def index

	end

	def challenge
		challengeStatus(params[:status])
	end
end
