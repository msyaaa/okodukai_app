class IncomesController < ApplicationController
  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.valid?
      @income.save
      redirect_to root_path
    else
      render :new
    end
  end

  def  edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    # user = User.find(current_user.id)
    # @incomes = user.incomes.order(date: :desc)
    # @outgos = Outgo.where(user_id: current_user.id).order(date: :desc)
    if @income.update(income_params)
      redirect_to top_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    
  end

  private
  def income_params
    params.require(:income).permit(:description, :price, :date).merge(user_id: current_user.id)
  end
end
