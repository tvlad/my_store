class ItemsController < ApplicationController
  
  def index
    @items =  Item.all
    @el = 0
    render text: @items.map{|i| "#{@el += 1}. Name - #{i.name}, Price - #{i.price}"}.join("<br/>")
    
  end
  
end
