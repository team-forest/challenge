class ApplicationController < ActionController::Base
  protect_from_forgery

  def challengeStatus(state)
  	case state
  	when 'completed'
  		@status = 'complete'
  	when 'pending'
  		@status = 'pending'
  	else
  		@status = 'none'
  	end
  end
end
