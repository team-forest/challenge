class Challenge < ActiveRecord::Base
  attr_accessible :exp, :name, :status, :user_id

  belongs_to :user
end
