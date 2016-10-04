class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :password, :description, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX }
	before_save do
		self.email.downcase!	
	end
end
