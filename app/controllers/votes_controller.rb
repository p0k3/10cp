class VotesController < ApplicationController

  def create
    user_id = nil
    user_id = current_user.id unless current_user.blank?
    vote = Vote.new user_id:  user_id , advice_id: params[:advice_id], is_good: params[:is_good], ip: request.remote_ip

    if vote.save
      respond_to do |format|
        format.json { render json: vote }
      end
    else
      respond_to do |format|
        format.json { render json: vote.errors.full_messages, status: 422 }
      end
    end
  end

end
