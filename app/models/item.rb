class Item < ActiveRecord::Base
  
#  attr_accessible :price, :name, :real, :weight, :description # depricated for rails 4.x
  
  validates :price, numericality: {greater_than: 0, allow_nil: false}
  validates :name, :description, presence: true
  
  belongs_to :category
  
  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
#  has_one :image, as: :imageable

  mount_uploader :image, ImageUploader
  
  after_initialize {puts "initialized"} # Item.new; Item.first
  after_save       {puts "saved"}  # item.save; item.create; item.update
#  after_create {category.inc(:items_count, 1)}
  after_update {puts "updated"}
#  after_destroy {category.inc(:items_count, -1)}
end
