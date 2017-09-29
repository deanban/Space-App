class UserCuriosity < ApplicationRecord
	belongs_to :user
	belongs_to :curiosity
end
