# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'pry'
module SeedData
 def self.extended(object)
   object.instance_exec do
      unless Order.find_by(cust_name: "Billy Bunter")
        @billy_bunter = Order.create(cust_name: "Billy Bunter", date: "08/12/16", time: "20:30", address: "Yewlands House, Yewlands, Hoddesdon, EN11 8BX")
      end
      unless Pizza.find_by(name: "Farmhouse")
        @farmhouse = Pizza.create(name: "Farmhouse")
      end
      unless Topping.find_by(name: "Ham")
        @ham = Topping.create(name: "Ham")
        @mushroom = Topping.create(name: "mushroom")
      end
    end
  end
end

extend SeedData if ARGV.include?("db:seed")