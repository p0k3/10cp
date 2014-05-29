class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_masters

  def get_masters
    @masters = Theme.masters
  end

end
