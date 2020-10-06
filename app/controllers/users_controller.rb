class UsersController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    @users = User.all
    respond_with @users
  end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: {code: 200, message: 'Logged in successfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data]
    }
  end

end
