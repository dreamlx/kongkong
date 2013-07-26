# coding: utf-8
class DailypostsController < InheritedResources::Base
  #before_filter :authenticate_user!, except: [:index, :by_day]
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
        format.html { redirect_to dailyposts_path, notice: 'Post was successfully created.' }
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

  def by_days
    by_days = Dailypost.order("updated_at DESC").each { |item| item.linkto = "/api/dailyposts/#{item.id}.json" }
    @by_days = by_days.group_by{|dy| dy.created_at.strftime("%B %d") }

    respond_to do |format|
      format.html { render :by_days }
      format.json { render json: @by_days }
    end
  end

  def index
    @by_days = Dailypost.where("girl_id = #{params[:girl_id]}").order("updated_at DESC").group_by{|dy| dy.updated_at.strftime("%B %d") }
    respond_to do |format|
      format.html { render :index}
      format.json { render json: @by_days }
    end
  end

  def toggle_publish
    @dailypost = Dailypost.find(params[:id])
    @dailypost.published? ? @dailypost.cancel : @dailypost.push_home
    redirect_to girl_dailyposts_path(params[:girl_id])
  end


  def toggle_favor
    @dailypost = Dailypost.find(params[:id])
    Loser.find(current_user).favor_toggle(@dailypost)
   
    respond_to do |format|
      format.html { redirect_to dailypost_path(@dailypost) }
      format.json { @daiypost }
    end
    
  end

  private
  def payment
    if params[:id] =~ /\d+/
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
    else
      redirect_to root_path
    end
  end

  def post_tracker
    if params[:id] =~ /\d+/
      tracker = Dailypost.find(params[:id]).visit_histories.build(user_id: current_user.id)
      tracker.save
    else
      redirect_to root_path
    end      
  end
end
