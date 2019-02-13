class ApplicationController < ActionController::Base
  before_action :configure_devise_paramaters, if: :devise_controller?

  def configure_devise_paramaters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :description, :password, :password_confirmation) }
  end
end
