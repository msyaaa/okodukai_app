class GoalsController < ApplicationController

  def create
    @goal = Goal.new(goal_params)
    if @goal.valid?
      @goal.save
      redirect_to root_path
    else
      render 'tops/index'
    end
  end
  private
  def goal_params
    params.permit(:text).merge(user_id: current_user.id)
  end
end
