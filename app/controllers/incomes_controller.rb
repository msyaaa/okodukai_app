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

  private
  def income_params
    params.require(:income).permit(:description, :price, :date).merge(user_id: current_user.id)
  end
end
