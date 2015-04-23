class Subjects::AdvicesController < ApplicationController

  before_filter :set_subject

  def show
    @advice = Advice.find params[:id]
  end

  def new
    @advice = @subject.advices.build
  end

  def create
    @advice = @subject.advices.build advice_params
    @advice.user = current_user if current_user

    if @advice.save
      if current_user
        @advice.validate
        redirect_to subject_path(@subject.slug, @subject.id), flash:{success: "Merci pour votre contribution."}
      else
        redirect_to subject_path(@subject.slug, @subject.id), flash:{success: "Votre conseil a été pris en compte et sera publié après validation par notre équipe de modérateurs."}
      end
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
      params.require(:advice).permit(:title, :description, :author_name, :author_email, :author_website)
    end
end