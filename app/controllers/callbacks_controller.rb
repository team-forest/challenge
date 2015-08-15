class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    #render json: request.env["omniauth.auth"]
    user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
    if user
      flash[:notice] = 'Login success'
      sign_in_and_redirect(:user, user)
    else
      flash[:alert] = 'Login fail'
      redirect_to root_url
    end
  end
end
