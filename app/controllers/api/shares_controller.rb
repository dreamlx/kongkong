class Api::SharesController < ApplicationController
	
	before_filter :authenticate_user!
	skip_before_filter :verify_authenticity_token
	respond_to :json

	def show 
		@share = Share.find(params[:id])
		@share_context = ShareContext.first
	end

	def index
		@shares = Share.where("user_id=#{current_user.id}")
	end

	def new
		@share = Share.new
	end

	def create 
		@dailypost = Dailypost.find(params[:id])
		if @dailypost.share_time.nil?
			@dailypost.share_time=1
		else
			@dailypost.share_time+=1
		end
		@dailypost.save
		@share = Share.new
		@share.dailypost_id = @dailypost.id
		@share.user_id = current_user.id
		@share.photo_url = @dailypost.photo.url+"?imageView/2/w/400/h/400"
		@share_context = ShareContext.first
		if @share.save

			render :status=>200,:json => { :response => 'created share', :id=>@share.id,:dailypost_id=>@dailypost.id,:share_time=>@dailypost.share_time
		else
			render :status=>403,:json => { :error => @share.errors}.to_json
		end
	end
end