class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :encrypted_password, :password, :password_confirmation, :remember_me, :name, :title, :img, :uid, :token

  def self.find_for_facebook_oauth(auth)
    user = find_by_uid(auth[:uid])
    unless user
      user = create(
        email: auth['info']['email'],
        password: auth['info']['email'],
        name:  auth['info']['name'],
        img:   auth['info']['image'] + "?width=220&length=220",
        uid:   auth['uid'],
        token: auth['credentials']['token']
      )
    end
    user
  end
end
