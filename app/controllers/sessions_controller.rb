class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    user = User.find_by_uid(auth['uid'])

    if user
      flash[:notice] = "Sign in successfully."
      sign_in_and_redirect(:user, user)
    else # create user
      new_user = User.new(user_params(auth))

      if new_user.save
        flash[:notice] = "Account created."
        sign_in_and_redirect(:user, new_user)
      else
        flash[:notice] = "Error in creating account."
        redirect_to root_url
      end

    end
  end

  def destroy
  end

  private 
    def user_params(auth)
      name = "#{auth['info']['first_name']} #{auth['info']['first_name']}"
      {
        email: auth['info']['email'],
        password: auth['credentials']['token'],
        name:  name,
        img:   auth['info']['image'],
        uid:   auth['uid'],
        token: auth['credentials']['token']
      }
    end
end
