class User < ActiveRecord::Base
  
#  attr_accessible :login # depricated for rails 4.x
  
  has_one :cart
  
end
