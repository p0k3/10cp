class AdminController < ApplicationController
  layout "admin/application"
  before_filter :authenticate_user!, :user_is_admin!

  def user_is_admin!
    unless current_user.is_admin?
      redirect_to root_url(subdomain: ''), flash:{warning: "Vous n'êtes pas autorisé à voir ceci"}
    end
    @noindex = true
  end
end
