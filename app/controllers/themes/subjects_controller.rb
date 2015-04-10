class Themes::SubjectsController < ApplicationController

  before_filter :set_theme, :authenticate_user!

  def new
    @subject = @theme.subjects.build
    @subject.advices.build user_id: current_user.id
  end

  def create
    @subject = Subject.new subject_params
    @subject.user = current_user
    @subject.theme = @theme

    if @subject.save
      redirect_to theme_path(@theme.slug, @theme.id), flash:{success: "Votre sujet a été pris en compte et sera publié après validation par notre équipe de modérateurs."}
    else
      render :new
    end
  end

  private
    def set_theme
      @theme = Theme.find params[:theme_id]
      @header_color = @theme.color
    end

    def subject_params
      params.require(:subject).permit(:title, :description, advices_attributes:[:title, :description, :user_id, :subject_id])
    end

end