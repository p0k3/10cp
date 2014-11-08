class ThemesController < ApplicationController

  def show
    @theme = Theme.find(params[:id])
    @header = @theme.color
  end


end
