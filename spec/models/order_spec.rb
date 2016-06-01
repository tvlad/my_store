require 'spec_helper'
require 'rails_helper'

describe Order do
  
  it 'calculates the total price of the order' do
    item1 = Item.new(price: 100)
    item2 = Item.new(price: 200)
    
    order = Order.new()
    order.items << item1
    order.items << item2
    
    order.calculate_total
    expect(order.total).to  eq(300)
  end

  it 'calculates the total price of the order using factory' do
    # i removed FactoryGirl and had include this method to <rails_helper> file
    item1 = create(:item)
    item2 = create(:item, price: 20)

    # it doesn't work after adding <before_save> to the <order> model
    # order = create(:order)
    order = Order.new()
    order.items << item1
    order.items << item2

    order.calculate_total
    expect(order.total).to  eq(30)
  end

  it 'raises exception if an order has no items in it' do
    expect(-> {create(:order)}).to raise_exception
  end

end