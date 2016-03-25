class ItemsController < ApplicationController
  
  #it resolved issue with "Token error"
    protect_from_forgery with: :null_session 
  
  def index
    #    @items =  Item.all
    #    render text: @items.map{|i| "#{i.id}. Name - #{i.name}, Price - #{i.price}"}.join("<br/>")
    @items =  Item.all
  end
  
  # /items/1 GET
  def show
    if @item = Item.where(id: params[:id]).first
      render "items/show"
    else
      render text: "Page not found \n 404",  status: 404
    end
  end
  
  # /items/new GET
  def new
    @item = Item.new
  end
  
  # /items/1/ GET
  def edit
    
  end
  
  # /items POST
  def create 
    #    p params 
    #    @item = Item.create(name: params[:name], description: params[:description], 
    #      price: params[:price], real: params[:real], weight: params[:weight])
    
    #    params.permit!
    #    @item = Item.create(params[:item])
    #    p params
    #    render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
    
    #    render text: "Item created"

    #    render params.inspect
    item_params = params.require(:item).permit(:price, :name, :real, :weight, :description)
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item.id)
    else
      render "new"
    end
  end
  
  # /items/1 PUT
  def update
    
  end
  
  # /items/1 DELETE
  def destroy
    
  end
  
end
