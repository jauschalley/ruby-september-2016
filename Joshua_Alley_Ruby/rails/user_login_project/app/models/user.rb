class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :age, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 150}
	validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX }
	before_save do
		self.email.downcase!	
	end
end
