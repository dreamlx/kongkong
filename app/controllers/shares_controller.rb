class SharesController < ApplicationController
	

	def show 
		@share = Share.find(params[:id])
		@share_context = ShareContext.first
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
