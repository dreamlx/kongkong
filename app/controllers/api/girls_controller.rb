class Api::GirlsController < ApplicationController
  respond_to :json
  def index
    @girls = Girl.order(" updated_at DESC")
  end

  def show
    @girl = Girl.find(params[:id])
  end
end
