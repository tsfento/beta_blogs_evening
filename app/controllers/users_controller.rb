class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: UserBlueprint.render(user, view: :normal), status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end
end
