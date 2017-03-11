class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  include SetCacheControlHeader

  def render_create_success
    render json: @resource
  end
end
