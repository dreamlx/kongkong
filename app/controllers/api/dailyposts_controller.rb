class Api::DailypostsController < ApplicationController
  respond_to :json
  def index
    @dailyposts = Dailypost.order(" updated_at DESC")
  end
  
  def show
    @dailypost = Dailypost.find(params[:id])
  end


  def today
    @dailyposts = Dailypost.where(["state = ?", "published"])
  end

  def by_day
    @by_days = Dailypost.order("updated_at DESC").group_by{|dy| dy.created_at }
  end
  
end
