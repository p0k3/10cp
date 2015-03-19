class ThemesController < ApplicationController

  def show
    @theme = Theme.find(params[:id])
    @subjects = @theme.subjects.validated

    @title = "Tous les conseils pour : #{@theme.title} - Retrouvez de bons conseils pour #{@theme.title}"
    @description = @theme.description
    @header_color = @theme.color
  end


end
