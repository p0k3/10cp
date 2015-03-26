class ThemesController < ApplicationController

  def show
    @theme = Theme.find(params[:id])
    if params[:slug] != @theme.slug
      redirect_to theme_path(@theme.slug, @theme.id), :status => 301
    end
    @subjects = @theme.subjects.validated

    @title = "Tous les conseils pour : #{@theme.title} - Retrouvez de bons conseils pour #{@theme.title}"
    @description = @theme.description
    @header_color = @theme.color
  end


end
