class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = {message: 'Account created successfully', auth_token: auth_token, username: user.username }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
