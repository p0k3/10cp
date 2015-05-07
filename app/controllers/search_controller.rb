class SearchController < ApplicationController

  def index
    if params[:q]
      keywords = params[:q].split(' ')
      where = ""
      keywords.each_with_index do |c, index|
        if index == 0
          where << "title LIKE '%#{c}%'"
        else
          where << "OR title LIKE '%#{c}%'"
        end
      end
      @subjects = Subject.where(where).uniq
    end
  end

end