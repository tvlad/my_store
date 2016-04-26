class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #  attr_accessible :login # depricated for rails 4.x
  

#  validates :password, length: { minimum: 4 }
#  validates :login, :email, :password, :password_confirmation, presence: true
  validates :email, presence: true
  
  validate :check_password_and_password_confirmation
  #  validates :email, email_format: { message: "doesn't look like an email address" }
  validates :email, email: true
  
  def check_password_and_password_confirmation
    errors.add(:password, "should be same with password confirmation") unless self.password == self.password_confirmation
  end
  
  has_one :cart
  has_many :orders
  has_many :comments
  
end
