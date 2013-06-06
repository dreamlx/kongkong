class Api::CreditsController < ApplicationController
  respond_to :json
  def show
    @credit = Credit.find(params[:id])
  end
end
