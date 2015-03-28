class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_masters, :set_variables

  def get_masters
    @masters = Theme.masters
  end

  def set_variables
    @header = "url('/assets/bg_header.jpg')"
    @master_themes = Theme.last 6

    @title = "10 conseils pour - Tout ce qu'il faut savoir sur tout"
    @description = "Tout ce qu'il faut savoir sur tout réuni dans les meilleurs conseils. Retrouvez des conseils pour la maison, la famille, le travail, vos loisirs et même pour votre ordinateur"
  end

end
