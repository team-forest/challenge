class Challenge < ActiveRecord::Base
  attr_accessible :exp, :name, :status, :user_id

  def self.addChallenge(params,userId)
  	#logger.info "what"
#  	logger.info params[:name]
  	self.create(user_id:userId,name:params[:name],exp:params[:exp])

  end

end
