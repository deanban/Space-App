class AsteroidsController < ApplicationController

  def index 
    @asteroids = Asteroid.all 
    render json: @asteroids 
  end

end