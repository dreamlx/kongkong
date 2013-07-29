class OrdersController < InheritedResources::Base
  def index
    @orders = current_user.credit.orders
  end

  def create
    order = Order.new
    order.credit_quantity = params[:price]
    order.content = params[:content]
    order.credit = current_user.credit
    order.save

    order.pay
    
    current_user.credit.caculate_balance(order)
    respond_to do |format|
      format.html { redirect_to credit_orders_path(params[:credit_id]) }
      format.json { render json: {order: order, credit: current_user.credit} }
    end
  end

end
