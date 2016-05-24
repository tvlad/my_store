class ItemsController < ApplicationController
  
  before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote, :devote]
  #  before_filter :check_if_admin, only: [:edit, :update, :new, :create, :destroy]
  
  #it resolved issue with "Token error"
  protect_from_forgery with: :null_session 
  
  def index
    #    @items =  Item.all
    #    render text: @items.map{|i| "#{i.id}. Name - #{i.name}, Price - #{i.price}"}.join("<br/>")
    @items =  Item
    @items = @items.where("price >= ?", params[:price_from]) if params[:price_from]
    @items = @items.where("created_at >= ?", 1.day.ago) if params[:today]
    @items = @items.where("votes_count >= ?", params[:votes_from]) if params[:votes_from]
    @items = @items.order('votes_count desc', 'price desc').limit(50)
    
    #    method for "eager loading" - not work now, because it's need to implement "has_one - image"
    #    @items = @items.includes(:image)
    
    end
  
  # /items/1 GET
  def show
    unless @item
      render text: "Page not found \n 404",  status: 404
    end
    #    old code with the IF implementation 
    #    if @item = Item.where(id: params[:id]).first
    #      render "items/show"
    #    else
    #      render text: "Page not found \n 404",  status: 404
    #    end
  end
  
  # /items/new GET
  def new
    @item = Item.new
  end
  
  # /items/1/ GET
  def edit
    #    @item = Item.find(params[:id])
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
    item_params = params.require(:item).permit(:price, :name, :real, :weight, :description, :image)
    @item = Item.create(item_params)
    if @item.errors.empty?
      flash[:success] = "All good!"
      redirect_to item_path(@item)
      #      render "show"
    else
      flash.now[:error] = "You make an error in the form. Please correct it!"
      render "new"
      #      redirect_to item_path("/items/new")
    end
  end
  
  # /items/1 PUT
  def update
    item_params = params.require(:item).permit(:price, :name, :real, :weight, :description, :image)
    
    @item.update_attributes(item_params)
    if @item.errors.empty?
      flash[:success] = "All good!"
      redirect_to item_path(@item)
    else
      flash.now[:error] = "You make an error in the form. Please correct it!"
      render "edit"      
    end
  end
  
  # /items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end
  
  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end
  
  #  decrease vote
  def devote
    @item.decrement!(:votes_count)
    redirect_to action: :index
  end
  
  def expensive
    @items = Item.where("price > 1000")
    render "index"
  end
  
  private
  
  def find_item
    #    @item = Item.find(params[:id]) #-was changed in ep. 17
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end
  
  #  removed to app_controller in ep.17
  #  def check_if_admin
  #    #    render text: "Access denied", status: 403 unless params[:admin] 
  #    render_403 unless params[:admin]
  #  end
  
end
