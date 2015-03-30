class Themes::SubjectsController < ApplicationController

  before_filter :set_theme, :authenticate_user!

  def new
    @subject = @theme.subjects.build
  end

  def create
    @subject = @theme.subjects.build subject_params
    @subject.user = current_user

    if @subject.save
      redirect_to theme_path(@theme.slub, @theme.id), flash:{success: "Votre sujet a été pris en compte et sera publié après validation par notre équipe de modérateurs."}
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
      params.require(:subject).permit(:title, :description)
    end

end