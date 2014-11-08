class Admin::ThemesController < AdminController

  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new params[:theme]
    if @theme.save
      redirect_to themes_path, flash: {success: "Le thème a bien été ajouté"}
    else
      render :new
    end
  end

  def edit
    @theme = Theme.find params[:id]
  end

  def update
    @theme = Theme.find params[:id]

    @theme.attributes = params[:theme]
    if @theme.save
      redirect_to themes_path, flash: {success: "Le thème a bien été mis à jour"}
    else
      render :edit
    end
  end

end