class SharesController < ApplicationController

	before_filter :effective_link, only: [:show]
	
	def effective_link
		time_now = Time.now
		@share = Share.find(params[:id])
		create_time = @share.created_at
		binding.pry
		puts "create_time is #{create_time}"
		puts "time now is #{time_now}"
		puts is_after(time_now,create_time)
		puts time_now.hour > create_time.hour
		if  is_after(time_now,create_time) 
			redirect_to root_path
		end
	end

	def show 
		@share = Share.find(params[:id])
		@share_context = ShareContext.first
		if @share.active_times.nil?
			@share.active_times=1
		else
			@share.active_times+=1
		end
		@share.save
		render :layout => false
	end

	def index
		@share = Share.find(params[:id])
	end

	def new
		@share = Share.new
		redirect_to shares_path
	end

	def create 
		@dailypost = Dailypost.find(params[:format])
		if @dailypost.share_time.nil?
			@dailypost.share_time=1
		else
			@dailypost.share_time+=1
			
		end
		@dailypost.save
		@share = Share.new
		@share.user_id = current_user.id
		@share.dailypost_id = @dailypost.id
		@share.photo_url = @dailypost.photo.url+"?imageView/2/w/400/h/400"
		if @share.save
			redirect_to share_url(@share)
		else
			render new_share_url
		end
	end
end
