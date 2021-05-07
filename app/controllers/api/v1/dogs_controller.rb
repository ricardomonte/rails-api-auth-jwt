class Api::V1::DogsController < ApplicationController
  def create
    dog = current_user.dogs.create!(dog_params)
    json_response(dog, :created)
  end

  private

  def dog_params
    params.permit(:name, :breed)
  end
  
end
