class Subjects::AdvicesController < ApplicationController

  before_filter :set_subject, :authenticate_user!

  def new
    @advice = @subject.advices.build
  end

  def create
    @advice = @subject.advices.build advice_params
    @advice.user = current_user

    if @advice.save
      redirect_to subject_path(@subject), flash:{success: "Votre conseil a été pris en compte et sera publié après validation par notre équipe de modérateurs."}
    else
      render :new
    end
  end

  private
    def set_subject
      @subject = Subject.find params[:subject_id]
      @header_color = @subject.theme_color
    end

    def advice_params
      params.require(:advice).permit(:title, :description)
    end
end