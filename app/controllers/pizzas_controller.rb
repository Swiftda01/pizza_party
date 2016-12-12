class PizzasController < ApplicationController

  def index
    @pizza = Pizza.new
    @pizzas = Pizza.all
    respond_to do |format|
      format.html {}
      format.json do
        render json: sanitize({
          authenticity_token: form_authenticity_token,
          pizzas: @pizzas
        })
      end
    end
  end

  def show
    @pizza = Pizza.find_by(id: params[:id])
    respond_to do |format|
      format.html {}
      format.json do
        render json: sanitize({
          pizza: @pizza,
          pizza_toppings: @pizza.toppings
        })
      end
    end

  end

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new(pizza_params)
    @pizza.save
    render json: sanitize(@pizza)
  end

  def update
    @pizza = Pizza.find_by(id: params[:id])
    @pizza.update(pizza_params)
    @topping = Topping.find(params[:topping_id].gsub("topping", ""))
    @pizza.toppings << @topping
    respond_to do |format|
      format.html {}
      format.json do
        render json: sanitize(@pizza) 
      end
    end
  end

  def destroy
    @pizza = Pizza.find_by(id: params[:id])
    @pizza.destroy
    render json: sanitize({id: @pizza.id, name: @pizza.name})
  end

  private
  def pizza_params
    params.permit(:name, :toppings, :topping_ids)
  end

end
