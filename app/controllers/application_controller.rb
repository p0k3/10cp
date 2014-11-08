class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_masters, :set_header

  def get_masters
    @masters = Theme.masters
  end

  def set_header
    @header = "url('/assets/bg_header.jpg')"
  end

end
