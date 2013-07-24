class Api::DailypostsController < ApplicationController
  before_filter :authenticate_user!, only: [:my_girls, :home]
  respond_to :json
  def index
    @dailyposts = Dailypost.order(" updated_at DESC")
  end
  
  def show
    @dailypost = Dailypost.find(params[:id])
    @dailypost.linkto = @dailypost.photo_url
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
end
