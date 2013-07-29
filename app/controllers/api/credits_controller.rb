class Api::CreditsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json
  def show
    @credit = Credit.find(params[:id])
  end
end
