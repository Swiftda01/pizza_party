class Order < ApplicationRecord
  has_many :pizzas, dependent: :destroy

  validates :cust_name, :address, :time, presence: true
end
