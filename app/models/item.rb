class Item < ActiveRecord::Base
  attr_accessible :price, :name, :real, :weight, :description
end
