class Themes::SubjectsController < ApplicationController

  before_filter :set_theme, :authenticate_user!

  def new
    @subject = @theme.subjects.build
  end

  def create
    @subject = @theme.subjects.build params[:subject]
    @subject.user = current_user

    if @subject.save
      redirect_to theme_path(@theme), flash:{success: "Votre sujet a été pris en compte et sera publié après validation par notre équipe de modérateurs."}
    else
      render :new
    end
  end

  private
    def set_theme
      @theme = Theme.find params[:theme_id]
    end

end