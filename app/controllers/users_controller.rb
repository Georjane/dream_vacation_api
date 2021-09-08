class UsersController < ApplicationController
  def create
    user = User.create(user_params)
     if user.save
      render json: UserRepresenter.new(user).as_json, status: :created
    else
      render json: { error: user.errors.full_messages.first }, status: :unprocessable_entity
    end
  end
  def index
    users = User.all

    render json: UsersRepresenter.new(users).as_json
  end
   private
   def user_params
    params.require(:user).permit(:username, :password)
  end
end
