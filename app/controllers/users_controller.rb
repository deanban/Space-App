class UsersController < ApplicationController

  skip_before_action :authorized, only: [:create]
  # I AM CREATING A User
  def create
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      token = encode_token({ user_id: user.id})
      render json: {user: user, jwt: token}
    else
    end
  end

  def show
  	@user = User.find_by(id: params[:id])
    if @user
      render json: { user: @user, curiosities: @user.curiosities}
    else
      render json: { message: "Error"}
    end

  end


end
