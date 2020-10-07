# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end

  def respond_with(resource, _opts = {})
    render json: {
      data: UserSerializer.new(resource).serializable_hash[:data]
    }
  end
end
