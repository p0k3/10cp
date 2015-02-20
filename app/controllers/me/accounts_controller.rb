class Me::AccountsController < MeController

  def home
    @user = current_user
  end

end