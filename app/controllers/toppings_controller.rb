class ToppingsController < ApplicationController
  def index
    @toppings = Topping.all
    respond_to do |format|
      format.html { @topping = Topping.new }
      format.json do
        render json: sanitize(@toppings)
      end
    end
  end
end
