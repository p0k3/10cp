class SubjectsController < ApplicationController

  def show
    @subject = Subject.find(params[:id])
    if params[:slug] != @subject.slug
      redirect_to subject_path(@subject.slug, @subject.id), :status => 301
    else
      @theme = @subject.theme
      @advices = @subject.advices.validated.order_by_notoriety

      @title = "10 conseils pour #{@subject.title}"
      @description = @subject.description[0..150]
      @header_color = @theme.color

      @similar_subjects = @theme.subjects.last 4
    end
  end

end
