class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include SetCacheControlHeader

  def render_create_success
    render json: @resource
  end

  def render_create_error
    render json: @resource, status: 422, serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
