class SharesController < ApplicationController
	

	def show 
		@share = Share.find(params[:id])
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
		@share = Share.new
		@share.user_id = current_user.id
		@share.dailypost_id = @dailypost.id
		@share.photo_url = @dailypost.photo.url
		if @share.save
			redirect_to share_url(@share)
		else
			render new_share_url
		end
	end
end
