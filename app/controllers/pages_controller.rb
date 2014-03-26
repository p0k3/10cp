class PagesController < ApplicationController

  def home
    @most_visited = Subject.last 4
    @master_themes = Theme.last 6
    @best_users = User.last 2
  end

end
