class Admin::VotesController < AdminController

  def index
    @q = Vote.ransack(params[:q])
    @votes = @q.result(distinct: true)
  end

end
