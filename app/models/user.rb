class User < ActiveRecord::Base
  
  #  attr_accessible :login # depricated for rails 4.x

  validates :password, length: { minimum: 4 }
  validates :login, :email, :password, :password_confirmation, presence: true
  
  validate :check_password_and_password_confirmation
  
  def check_password_and_password_confirmation
    errors.add(:password, "should be same with password confirmation") unless self.password == self.password_confirmation
  end
  
  has_one :cart
  has_many :orders
  
end
