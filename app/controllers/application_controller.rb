# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Add this before_action to configure Devise params
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ... your existing rescue_from and check_authorization code ...
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: exception.message }
      format.json { render json: { error: exception.message }, status: :forbidden }
    end
  end

  check_authorization unless: :devise_controller?

  protected

  # Add this method to permit the :name attribute
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end
end
