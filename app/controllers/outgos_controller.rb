class OutgosController < ApplicationController
  def new
    @outgo = Outgo.new
  end

  def create
    user = User.find(current_user.id)
    income_sum = user.incomes.sum(:price)
    outgo_sum = user.outgos.sum(:price)
    total = income_sum - outgo_sum
    @outgo = Outgo.new(outgo_params)
    if @outgo.valid? && total - outgo_params[:price].to_i >= 0
      @outgo.save
      redirect_to root_path
    elsif total - outgo_params[:price].to_i < 0
      flash.now[:alert] = '残(のこ)っているお金が足りないよ！入力をやり直してね！'
      render :new
    else
      render :new
    end
  end

  def edit
    @outgo = Outgo.find(params[:id])
  end

  def update
    user = User.find(current_user.id)
    income_sum = user.incomes.sum(:price)
    outgo_sum = user.outgos.sum(:price)
    total = income_sum - outgo_sum
    @outgo = Outgo.find(params[:id])
    # user = User.find(current_user.id)
    if total + @outgo.price >= outgo_params[:price].to_i
      if @outgo.update(outgo_params)
        redirect_to top_path(current_user.id)
      else
        render :edit
      end
    else
      flash.now[:alert] = '残(のこ)っているお金が足りないよ！入力をやり直してね！'
      render :edit
    end
  end

  def destroy
    outgo = Outgo.find(params[:id])
    user = User.find(current_user.id)
    @outgos = user.outgos.order(date: :desc)
    if outgo.destroy
      redirect_to top_path(current_user.id)
    else
      render 'tops/show'
      # redirect_to
    end
  end

  private

  def outgo_params
    params.require(:outgo).permit(:description, :price, :date).merge(user_id: current_user.id)
  end
end
