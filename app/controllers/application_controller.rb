class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: '/home/index'
 
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :surname, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :surname, :email, :password, :current_password)}
  end
end
