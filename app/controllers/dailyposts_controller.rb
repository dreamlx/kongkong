class DailypostsController < InheritedResources::Base
  before_filter :authenticate_user!
  def new
    @girl = Girl.find(params[:girl_id])
    @dailypost = Dailypost.new
  end

  def edit
    @girl = Girl.find(params[:girl_id])
    @dailypost = Dailypost.find(params[:id])
  end

  def create
    @dailypost = Dailypost.new(params[:dailypost])
    respond_to do |format|
      if @dailypost.save
        format.html { redirect_to girl_dailyposts_path(params[:girl_id]), notice: 'Post was successfully created.' }
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
    @by_days = Dailypost.order("updated_at DESC").group_by{|dy| dy.created_at }
  end

end
