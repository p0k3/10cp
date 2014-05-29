class ThemesController < ApplicationController

  def show
    @theme = Theme.find(params[:id])
  end


end
