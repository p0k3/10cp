class Admin::SubjectsController < AdminController

  def index
    @subjects = Subject.order('id DESC').all
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
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]

    @subject.attributes = params[:subject]
    if @subject.save
      redirect_to subjects_path, flash: {success: "Le thème a bien été mis à jour"}
    else
      render :edit
    end
  end

end
