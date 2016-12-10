class OrdersController < ApplicationController

  def index
    @order = Order.new
    @orders = Order.all
    @ingredients = Topping.order(:name)
    respond_to do |format|
      format.html {}
      format.json do
        render json: sanitize({
          authenticity_token: form_authenticity_token,
          orders: @orders
        })
      end
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
  end

  private 
  def order_params
    params.permit(:cust_name, :address, :date, :time, :pizza_ids)
  end

end
