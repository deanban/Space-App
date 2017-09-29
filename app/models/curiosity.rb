class Curiosity < ApplicationRecord
	
	has_many :user_curiosities
	has_many :users, through: :user_curiosities

end
