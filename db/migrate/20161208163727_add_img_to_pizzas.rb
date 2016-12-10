class AddImgToPizzas < ActiveRecord::Migration[5.0]
  def change
    add_column :pizzas, :img, :string
  end
end
