class AddImgToToppings < ActiveRecord::Migration[5.0]
  def change
    add_column :toppings, :img, :string
  end
end
