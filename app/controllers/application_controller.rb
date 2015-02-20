class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_masters, :set_variables

  def get_masters
    @masters = Theme.masters
  end

  def set_variables
    @header = "url('/assets/bg_header.jpg')"
    @most_visited = Subject.last 4
    @master_themes = Theme.last 6
    @best_users = User.best_advisors
  end

end
