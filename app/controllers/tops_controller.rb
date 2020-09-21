class TopsController < ApplicationController
  def index
    # ユーザー登録していないと表示されない
    if current_user.present?
      # 目標の表示
      user = User.find(current_user.id)
      @goal = user.goal
    # 目標の表示ここまで
    
    # 貯金合計金額の表示
      user = User.find(current_user.id)
      income_sum = user.incomes.sum(:price)
      outgo_sum = user.outgos.sum(:price)
      @total = income_sum - outgo_sum
    # 貯金合計金額の表示ここまで
    end
  end

  def show
    # @incomes = Income.where(user_id: params[:id]).order(date: :desc)
    # user = User.find(params[:id])
    user = User.find(current_user.id)
    @incomes = user.incomes.order(date: :desc)
    # @outgos = Outgo.where(user_id: params[:id]).order(date: :desc)
    @outgos = user.outgos.order(date: :desc)
    # @all = @incomes + @outgos
  end

  # def  edit
  #   @income = Income.find(params[:id])
  # end
  
end
