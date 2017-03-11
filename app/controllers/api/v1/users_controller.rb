class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!

  def validate_email_uniqueness
    parameters = validate_email_uniqueness_params
    render json: { exists: User.exists?(parameters) }
  end

  private

  def validate_email_uniqueness_params
    params.permit(:email).to_h
  end
end
