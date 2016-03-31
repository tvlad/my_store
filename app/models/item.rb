class Item < ActiveRecord::Base
  
#  attr_accessible :price, :name, :real, :weight, :description # depricated for rails 4.x
  
  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :description, presence: true
  
  belongs_to :category
  
  after_initialize {puts "initialized"} # Item.new; Item.first
  after_save       {puts "saved"}  # item.save; item.create; item.update
#  after_create {category.inc(:items_count, 1)}
  after_update {puts "updated"}
#  after_destroy {category.inc(:items_count, -1)}
end
