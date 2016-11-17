class Admin::ThemesController < AdminController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  # GET /themes
  def index
    @q = Theme.ransack(params[:q])
    @themes = @q.result(distinct: true)
  end

  # GET /themes/1
  def show
  end

  # GET /themes/new
  def new
    @theme = Theme.new
  end

  # GET /themes/1/edit
  def edit
  end

  # POST /themes
  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to [:admin, :themes], notice: 'Theme was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /themes/1
  def update
    if @theme.update(theme_params)
      redirect_to [:admin, :themes], notice: 'Theme was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /themes/1
  def destroy
    @theme.destroy
    redirect_to themes_url, notice: 'Theme was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def theme_params
      params.required(:theme).permit(:title, :slug, :color, :description, :icon)
    end
end
