class AdvicesController < ApplicationController

  def index
    @advices = Advice.validated.order('created_at DESC').first 50
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end


end