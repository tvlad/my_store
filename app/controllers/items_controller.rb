class ItemsController < ApplicationController
  
  def index
    @items =  Item.all
    
    render text: @items.map{|i| "#{i.id}. Name - #{i.name}, Price - #{i.price}"}.join("<br/>")
    
  end
  
  def create 
    #    p params 
    #    @item = Item.create(name: params[:name], description: params[:description], 
    #      price: params[:price], real: params[:real], weight: params[:weight])
    params.permit!
    @item = Item.create(params[:item])
    p params
    render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  end
  
end
