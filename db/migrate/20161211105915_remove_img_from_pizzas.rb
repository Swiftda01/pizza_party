class RemoveImgFromPizzas < ActiveRecord::Migration[5.0]
  def change
    remove_column :pizzas, :img, :string
  end
end
