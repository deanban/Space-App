
class CuriositiesController < ApplicationController


	def index
		@curiosity = Curiosity.all
		render json: @curiosity
	end

end
