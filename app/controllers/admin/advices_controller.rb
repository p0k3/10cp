class Admin::AdvicesController < AdminController
  before_action :set_advice, only: [:show, :edit, :update, :destroy, :validate]

  # GET /advices
  def index
    @q = Advice.ransack(params[:q])
    @advices = @q.result(distinct: true)
  end

  # GET /advices/1
  def show
  end

  # GET /advices/new
  def new
    @advice = Advice.new
  end

  # GET /advices/1/edit
  def edit
  end

  # POST /advices
  def create
    @advice = Advice.new(advice_params)

    if @advice.save
      redirect_to admin_advices_path, flash: {success: "Le conseil a été créé"}
    else
      render :new
    end
  end

  # PATCH/PUT /advices/1
  def update
    if @advice.update(advice_params)
      redirect_to admin_advices_path, flash: {success: "Le conseil a été mis à jour"}
    else
      render :edit
    end
  end

  # DELETE /advices/1
  def destroy
    @advice.destroy
    redirect_to advices_url, notice: 'Advice was successfully destroyed.'
  end

  def validate
    @advice.validate
    redirect_to admin_advices_path, flash:{success: "Le conseil a été validé et publié"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advice
      @advice = Advice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advice_params
      params.require(:advice).permit(:title, :description, :subject_id, :author_name, :author_website, :author_email)
    end
end
