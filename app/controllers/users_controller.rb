class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def index
    #    @items =  Item.all
    #    render text: @items.map{|i| "#{i.id}. Name - #{i.name}, Price - #{i.price}"}.join("<br/>")
    @users =  User.all
  end
  
  def show
    if @user = User.where(id: params[:id]).first
      render "users/show"
    else
      render text: "Page not found \n 404",  status: 404
    end
  end
  
  def edit
    #    @user = User.find(params[:id])
  end
  
  
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
    user_params = params.require(:user).permit(:login, :email, :password)
    @user = User.create(user_params)
    if @user.errors.empty?
      redirect_to item_path(@user)
      #      render "show"
    else
      render "new"
      #      redirect_to item_path("/items/new")
    end
  end
  
end
