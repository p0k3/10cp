class SubjectsController < ApplicationController

  def index
    @subjects = Subject.validated.order('created_at DESC').first 50
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @subject = Subject.find(params[:id])
    if params[:slug] != @subject.slug
      redirect_to subject_path(@subject.slug, @subject.id), :status => 301
    else
      @theme = @subject.theme
      @advices = @subject.advices.validated.order_by_notoriety

      @title = "#{@subject.title} - 10 conseils pour - #{@subject.theme_title}"
      @description = "10 conseils pour #{@subject.title.downcase} - #{@subject.theme_title} - #{@subject.description[0..100]}"
      @header_color = @theme.color

      @similar_subjects = @theme.subjects.last 4
    end
  end

end
