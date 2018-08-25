class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def authenticate_user!(force: false)
    token_rec = JwToken.where(jti: get_jti_token).first
    @current_user = User.find token_rec.user_id if token_rec.present?
  end

  def get_jti_token
    request.headers['Authorization']&.to_s.split(' ')[1] if request.headers['Authorization'].present?
  end
end