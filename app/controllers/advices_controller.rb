class AdvicesController < ApplicationController

  def create
    @subject = Subject.find(params[:subject_id])
    @advice = Advice.new(params[:advice])
    @subject.advices << @advice
    if @subject.save
      flash[:success] = t(:'advices.flash.save.ok')
      redirect_to subject_path params[:subject_id]
    else
      render "subjects/show"
    end
  end

end