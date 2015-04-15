class AuthenticationsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]

    # Try to find authentication first
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

    if authentication
      # Authentication found, sign the user in.
      flash[:success] = "Vous êtes maintenant connecté."
      sign_in_and_redirect(:user, authentication.user)
    else
      # Authentication not found, thus a new user.
      user = User.new
      user.apply_omniauth(auth)
      if user.save(:validate => false)
        flash[:success] = "Account created and signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        flash[:error] = "Un problème est survenue pendant la création du compte."
        redirect_to root_url
      end
    end
  end
end