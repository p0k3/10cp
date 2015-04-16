class VotesController < ApplicationController

  def create
    user_id = nil
    user_id = current_user.id unless current_user.blank?
    vote = Vote.new user_id:  user_id , advice_id: params[:advice_id], is_good: params[:is_good], ip: request.remote_ip

    @advice = Advice.find params[:advice_id]
    @subject = Subject.find @advice.subject_id
    @theme = Theme.find @subject.theme_id
    @advices = @subject.advices.validated.order_by_notoriety

    if vote.save
      respond_to do |format|
        format.json { render json: vote }
        format.js
      end
    else
      respond_to do |format|
        format.json { render json: vote.errors.full_messages, status: 422 }
        format.js
      end
    end
  end

end
