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

  private
  def outgo_params
    params.require(:outgo).permit(:description, :price, :date).merge(user_id: current_user.id)
  end
end
