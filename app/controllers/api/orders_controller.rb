class Api::OrdersController < ApplicationController
  def index
    @orders = Order.where("credit_id = #{current_user.credit.id}")
  end

  def show
    @order = Order.find(params[:id])
  end

end
