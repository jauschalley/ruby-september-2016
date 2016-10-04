class User < ActiveRecord::Base
  has_secure_password
  has_many :joins
  has_many :events, through :joins
 
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, :password, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX }
  validates :state, presence: true, length: { in: 2..2 }
	before_save do
		self.email.downcase!	
	end
end
