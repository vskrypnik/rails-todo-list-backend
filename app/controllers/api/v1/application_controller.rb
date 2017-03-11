class Api::V1::ApplicationController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions
  include SetCacheControlHeader

  respond_to :json

  before_action :authenticate_user!

  alias :current_user :current_api_v1_user

  def authenticate_user!
    unless current_user
      head :unauthorized
    end
  end

  rescue_from CanCan::AccessDenied, with: -> { head :unauthorized }
end
