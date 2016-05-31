require 'spec_helper'
require 'rails_helper'

describe Order do
  
  it "calculates the total price of the order" do
    item1 = Item.new(price: 100)
    item2 = Item.new(price: 200)
    
    order = Order.new()
    order.items << item1
    order.items << item2
    
    order.calculate_total
    expect(order.total).to  eq(300)
  end
  
 
  
  
end