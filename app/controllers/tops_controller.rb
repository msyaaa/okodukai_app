class TopsController < ApplicationController
  def index
    if current_user.present?
      user = User.find(current_user.id)
      @goal = user.goal
    end
  end

  def show
    @incomes = Income.where(user_id: params[:id]).order(date: :desc)
    @outgos = Outgo.where(user_id: params[:id]).order(date: :desc)
    # @all = @incomes + @outgos
  end

  def  edit

  end

  def destroy
    
  end
end
