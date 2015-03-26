class SubjectsController < ApplicationController

  before_filter :set_theme, only: :show

  def show
    @subject = Subject.find(params[:id])
    if params[:slug] != @subject.slug
      redirect_to subject_path(@theme.slug, @theme.id, @subject.slug, @subject.id), :status => 301
    end
    @advices = @subject.advices.validated.order_by_notoriety

    @title = "10 conseils pour #{@subject.title}"
    @description = @subject.description[0..150]
    @header_color = @theme.color
  end

  private
    def set_theme
      @theme = Theme.find(params[:theme_id])
    end

end
