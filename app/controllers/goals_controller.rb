class GoalsController < ApplicationController

  def create
    @goal = Goal.new(goal_params)
    if @goal.valid?
      @goal.save
      redirect_to root_path
    else
      # render 'tops/index'
      redirect_to root_path
    end
  end

  def update
    # user = User.find(params[:id])
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params2)
      redirect_to root_path
    else
      # render 'tops/index'
      redirect_to root_path
    end
  end
  private
  def goal_params
    params.permit(:text).merge(user_id: current_user.id)
  end
  def goal_params2
    params.require(:goal).permit(:text).merge(user_id: current_user.id)
  end
end
