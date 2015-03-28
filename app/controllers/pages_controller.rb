class PagesController < ApplicationController

  def home
    @most_visited = Subject.validated.order('created_at DESC').last 4
    @best_users = User.best_advisors.first 2
  end

  def sitemap
  end

  def show
    if File.exists?(File.join(Rails.root, "app", "views", "pages", params[:page] + ".html.haml"))
      @title = t("seo.title.#{params[:page]}")
      @description = t("seo.description.#{params[:page]}")
      render params[:page]
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
