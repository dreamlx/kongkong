class OrdersController < InheritedResources::Base
  def payment
    order = Order.new
    order.credit_quantity = params["price"]
    order.credit = current_user.credit
    order.save

    order.pay
    
    current_user.credit.caculate_balance(order)
    respond_to do |format|
      format.html { redirect_to orders_path }
      format.json { render json: order }
    end
    
  end
end
