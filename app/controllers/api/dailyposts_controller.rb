class Api::DailypostsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  respond_to :json
  def index
    @dailyposts = Dailypost.order(" updated_at DESC")
  end
  
  def show
    @dailypost = Dailypost.find(params[:id])
    @dailypost.linkto = @dailypost.photo_url
    visit_log = VisitHistory.where("user_id = #{current_user.id} and dailypost_id = #{@dailypost.id}").first

    if visit_log
      visit_log.update_attributes(visit_count: (visit_log.visit_count.to_i + 1))
    else
      tracker = @dailypost.visit_histories.build(user_id: current_user.id, visit_count: 1)
      tracker.save
    end
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
    render json: { dailypost:@dailypost, favor_state: Loser.find(current_user).favor_state(@dailypost) }
  end

  def pay_it
    @dailypost = Dailypost.find(params[:id])
    visit_log = VisitHistory.where("user_id = #{current_user.id} and dailypost_id = #{@dailypost.id}").first

    visit_log.update_attributes(state: "paid") if visit_log.state != 'paid'
    render json: { dailypost:@dailypost, payment_state: @dailypost.payment_state }

    #todo 扣款
  end

end
