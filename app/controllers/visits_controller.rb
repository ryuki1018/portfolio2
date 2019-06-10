class VisitsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    spot = Spot.find(params[:spot_id])
    current_user.like(spot)
    flash[:success] = "訪問済みにしました"
    redirect_to spot
  end

  def destroy
    spot = Spot.find(params[:spot_id])
    current_user.unlike(spot)
    flash[:danger] ="訪問済みを取り消しました"
    redirect_to spot
  end
end
