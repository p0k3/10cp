class AdvicesController < ApplicationController

  def create
    @advice = Advice.new(params[:advice])
    @advice.subject_id = params[:subject_id]
    if @advice.save
      flash[:success] = t(:'advices.flash.save.ok')
      redirect_to subject_path params[:subject_id]
    else
      render :new
    end
  end

end