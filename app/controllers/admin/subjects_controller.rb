class Admin::SubjectsController < AdminController
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :validate]

  respond_to :html

  def index
    @q = Subject.ransack(params[:q])
    @subjects = @q.result(distinct: true)
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to admin_subjects_path
    else
      render :new
    end
  end

  def update
    @subject.update(subject_params)
    if @subject.save
      redirect_to admin_subjects_path
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    respond_with(@subject)
  end

  def validate
    @subject.validate
    redirect_to admin_subjects_path, flash:{success: "Le sujet a été validé et publié"}
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:title, :description, :theme_id)
    end
end
