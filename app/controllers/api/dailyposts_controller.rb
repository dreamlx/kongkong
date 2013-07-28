class Api::DailypostsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  def index
    @dailyposts = Dailypost.order(" updated_at DESC")
  end
  
  def show
    @dailypost = Dailypost.find(params[:id])
    @dailypost.linkto = @dailypost.photo_url

    tracker = @dailypost.visit_histories.build(current_user.id)
    tracker.save
    
    @favor_state = Loser.find(current_user).favor_state(@dailypost)
  end

  def by_days
    @by_days = Dailypost.order("updated_at DESC").group_by{|dy| dy.created_at.strftime("%B %d") }
  end
  
  def home
    @dailyposts = Dailypost.published_items.each{ |item| item.linkto = "/api/dailyposts/by_days.json" }
    render :index
  end

  def my_girls
    @dailyposts = Dailypost.my_girls(current_user.id)
    render :index
  end

  def toggle_favor
    @dailypost = Dailypost.find(params[:id])
    Loser.find(current_user).favor_toggle(@dailypost)
    @dailypost[:favor_state] = Loser.find(current_user).favor_state(@dailypost)
    render json: { dailypost: @dailypost, favor_state: Loser.find(current_user).favor_state(@dailypost) }
  end

  #todo
  # payment it
end
