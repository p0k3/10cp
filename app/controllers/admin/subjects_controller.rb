class Admin::SubjectsController < AdminController

  before_filter :set_subject, except: [:index]

  def index
    @q = Subject.ransack(params[:q])
    @subjects = @q.result(distinct: true).paginate(:page => params[:page])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new params[:subject]

    if @subject.save
      redirect_to subjects_path, flash: {success: "Le sujet a bien été ajouté"}
    else
      render :new
    end
  end

  def edit
  end

  def update
    @subject.attributes = params[:subject]
    if @subject.save
      redirect_to subjects_path, flash: {success: "Le sujet a bien été mis à jour"}
    else
      render :edit
    end
  end

  def validate
    if @subject.validate
      redirect_to subjects_path, flash:{success: "Le sujet a été validé"}
    else
      render :edit
    end
  end

  def disable
    if @subject.invalidate
      redirect_to subjects_path, flash:{success: "Le sujet a été invalidé"}
    else
      render :edit
    end
  end

  private
    def set_subject
      @subject = Subject.find params[:id]
    end

end
