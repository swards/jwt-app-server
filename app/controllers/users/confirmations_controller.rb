# frozen_string_literal: true

module Users
  class ConfirmationsController < Devise::ConfirmationsController
    respond_to :json

    def show
      @user = User.confirm_by_token(params[:confirmation_token])
      respond_with(@user)
    end

    private

    def respond_with(resource, _opts = {})
      render json: {
        data: UserSerializer.new(resource).serializable_hash[:data]
      }
    end

  end

end