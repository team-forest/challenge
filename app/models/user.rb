class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  attr_accessible :email, :encrypted_password, :password, :password_confirmation, :remember_me, :name, :title, :img, :uid, :token

  has_many :challenges
  has_many :challenge_sent, class_name: 'Challenge'
  has_many :achievements

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
