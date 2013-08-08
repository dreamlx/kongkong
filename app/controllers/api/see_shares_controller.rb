class Api::SeeSharesController < ApplicationController
	
	before_filter :authenticate_user!
	skip_before_filter :verify_authenticity_token
	respond_to :json

	def show
		@share = Share.where(user_id:"#{current_user.id}",dailypost_id:params[:id])
		@see_share = SeeShare.find_by_share_id(@share.id)
	end

	def index
		@see_shares = SeeShare.all
	end
end