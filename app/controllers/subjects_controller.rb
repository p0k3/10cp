class SubjectsController < ApplicationController

  def index
    @subjects = Subject.validated
  end

  def show
    @subject = Subject.find(params[:id])
    @advices = @subject.advices.validated.order_by_notoriety

    @title = "10 conseils pour #{@subject.title}"
    @description = @subject.description[0..150]
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject= Subject.new(params[:subject])
    if @subject.save
      flash[:success] = t(:'subjects.flash.save.ok')
      redirect_to subject_path @subject.id
    else
      render :new
    end
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:success] = t(:'subjects.flash.save.ok')
      redirect_to subject_path params[:id]
    else
      render :show
    end
  end

end
