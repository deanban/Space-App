class User < ApplicationRecord
	has_secure_password
	
	has_many :user_curiosities
	has_many :curiosities, through: :user_curiosities

end
