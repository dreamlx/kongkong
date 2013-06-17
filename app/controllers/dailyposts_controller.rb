# coding: utf-8
class DailypostsController < InheritedResources::Base
  before_filter :authenticate_user!, except: [:today, :by_day]
  before_filter :payment, :post_tracker, only: [:show]
  
  def new
    @girl = Girl.find(params[:girl_id])
    @dailypost = Dailypost.new
  end

  def edit
    @dailypost = Dailypost.find(params[:id])
    @girl = Girl.find(params[:girl_id] || @dailypost.girl_id)
  end

  def create
    @dailypost = Dailypost.new(params[:dailypost])
    respond_to do |format|
      if @dailypost.save
        format.html { redirect_to girl_dailyposts_path(@dailypost.girl), notice: 'Post was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @dailypost = Dailypost.find(params[:id])
    @dailypost.destroy

    respond_to do |format|
      format.html { redirect_to girl_dailyposts_path(params[:girl_id]) }
      format.json { head :no_content }
    end
  end

  def today
    @dailyposts = Dailypost.where(["state = ?", "published"])
  end

  def by_day
    @by_days = Dailypost.order("updated_at DESC").group_by{|dy| dy.updated_at.strftime("%B %d") }
  end

  def toggle_state
    @dailypost = Dailypost.find(params[:id])

    @dailypost.published? ? @dailypost.cancel : @dailypost.push_home
    redirect_to girl_dailyposts_path(params[:girl_id])
  end

  private
  def payment
    user = User.find(current_user.id)
    post = Dailypost.find(params[:id])
    balance = user.credit.balance
    balance = balance - post.cost.to_i

    if balance < 0 then
      flash[:alert] = "钱不够，请充值"
      redirect_to credit_orders_path(current_user.credit)
    
    else
      mycredit = user.credit
      mycredit.update_attributes(:balance => balance)
      #mycredit.create_credit_line_items.build(amount: post.cost.to_i)
      mycredit.save
    end
    
    
  end

  def post_tracker
    tracker = Dailypost.find(params[:id]).visit_histories.build(user_id: current_user.id)
    tracker.save
  end
end
