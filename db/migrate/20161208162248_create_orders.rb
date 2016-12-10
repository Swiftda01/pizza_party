class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :cust_name

      t.timestamps
    end
  end
end
