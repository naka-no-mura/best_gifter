class Api::V1::UsersController < ApplicationController
  before_action :authenticate!, only: %i[me]

  def create
    
    binding.pry
    
    user = User.new(user_params)

    if user.save
      render json: user
    else
      # render json: user.errors, status: :bad_request
      render json: { errors: user.errors.keys.map { |key| [key, user.errors.full_messages_for(key)]}.to_h }, status: :unprocessable_entity
    end
  end

  def me
    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
