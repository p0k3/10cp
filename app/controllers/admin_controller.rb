class AdminController < ApplicationController
  layout "admin/application"
  before_filter :authenticate_user!, :user_is_admin!

  def user_is_admin!
    current_user.is_admin?
  end
end
