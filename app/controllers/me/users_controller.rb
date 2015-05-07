class Me::UsersController < MeController

  before_filter :set_user

  def edit
    @noindex = true
  end

  private
    def set_user
      @user = current_user
    end

end