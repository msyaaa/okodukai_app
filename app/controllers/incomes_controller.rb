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
    user = User.find(current_user.id)
    income_sum = user.incomes.sum(:price)
    outgo_sum = user.outgos.sum(:price)
    total = income_sum - outgo_sum
    @income = Income.find(params[:id])
    # user = User.find(current_user.id)
    # @incomes = user.incomes.order(date: :desc)
    # @outgos = Outgo.where(user_id: current_user.id).order(date: :desc)
    # if @income.price - total <= income_params[:price].to_i && income_params[:price] != ""
    if @income.price - total <= income_params[:price].to_i
      if @income.update(income_params)
        redirect_to top_path(current_user.id)
      else
        render :edit
      end
    # elsif @income.price - total > income_params[:price].to_i
    #   if @income.update(income_params)
    #     flash.now[:alert] = '残(のこ)っているお金が足りないよ！入力をやり直してね！'
    #     render :edit
    #   else
    #     render :edit
    #   end
    else
      # if @outgo.update(outgo_params)
      #   render :edit
      # else
      flash.now[:alert] = '残(のこ)っているお金が足りないよ！入力をやり直してね！'
      render :edit
      # end
    end
  end

  def destroy
    user = User.find(current_user.id)
    income_sum = user.incomes.sum(:price)
    outgo_sum = user.outgos.sum(:price)
    total = income_sum - outgo_sum
    income_price = Income.find(params[:id]).price
    income = Income.find(params[:id])
    # user = User.find(current_user.id)
    @incomes = user.incomes.order(date: :desc)
    # @outgos = user.outgos.order(date: :desc)
    if income.destroy && total - income_price >= 0
      redirect_to top_path(current_user.id)
    elsif total - income_price < 0
      flash[:alert] = '残(のこ)っているお金が足りないよ！入力をやり直してね！'
      redirect_to controller: :tops, action: :show
    else
      # render 'tops/show'
      redirect_to controller: :tops, action: :show
    end
  end

  private
  def income_params
    params.require(:income).permit(:description, :price, :date).merge(user_id: current_user.id)
  end
end
