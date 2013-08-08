class Api::DailypostsController < ApplicationController
	
	before_filter :authenticate_user!
  	skip_before_filter :verify_authenticity_token
  	respond_to :json

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
		@share.save
	end
end