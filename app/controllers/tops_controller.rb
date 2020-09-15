class TopsController < ApplicationController
  def index
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
