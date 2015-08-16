class Achievement < ActiveRecord::Base
  attr_accessible :badge, :name
  belongs_to :user
end
