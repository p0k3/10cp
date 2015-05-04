class ThemesController < ApplicationController

  def show
    @theme = Theme.find(params[:id])
    if params[:slug] != @theme.slug
      redirect_to theme_path(@theme.slug, @theme.id), :status => 301
    end
    @subjects = @theme.subjects.validated.order('created_at DESC')

    @title = "#{@theme.title} - 10 Conseils Pour - Retrouvez de bons conseils pour #{@theme.title}"
    @description = "Tous les bons conseils pour #{@theme.title} - #{@theme.description[0..100]}"
    @header_color = @theme.color
  end


end
