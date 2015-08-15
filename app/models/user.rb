class User < ActiveRecord::Base
  attr_accessible :active_challenge, :email, :exp, :name, :rating, :title, :uid
end
