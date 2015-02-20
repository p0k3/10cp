class Admin::AdvicesController < AdminController

  before_filter :set_advice, except: [:index]

  def index
    @q = Advice.ransack(params[:q])
    @advices = @q.result(distinct: true).paginate(:page => params[:page])
  end

  def edit
  end

  def update
    @advice.attributes = params[:advice]
    if @advice.save
      redirect_to advices_path, flash:{ success: "Le conseil a été modifié." }
    else
      render :edit
    end
  end

  def validate
    if @advice.validate
      redirect_to advices_path, flash:{success: "Le conseil a été validé"}
    else
      render :edit
    end
  end

  def disable
    if @advice.invalidate
      redirect_to advices_path, flash:{success: "Le conseil a été invalidé"}
    else
      render :edit
    end
  end

  private
    def set_advice
      @advice = Advice.find params[:id]
    end

end
