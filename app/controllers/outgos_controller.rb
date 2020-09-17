class OutgosController < ApplicationController
  def new
    @outgo = Outgo.new
  end

  def create
    @outgo = Outgo.new(outgo_params)
    if @outgo.valid?
      @outgo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def  edit
    @outgo = Outgo.find(params[:id])
  end

  def update
    @outgo = Outgo.find(params[:id])
    # user = User.find(current_user.id)
    # @incomes = user.incomes.order(date: :desc)
    # @outgos = Outgo.where(user_id: current_user.id).order(date: :desc)
    if @outgo.update(outgo_params)
      redirect_to top_path(current_user.id)
    else
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
    end
  end

  private
  def outgo_params
    params.require(:outgo).permit(:description, :price, :date).merge(user_id: current_user.id)
  end
end
