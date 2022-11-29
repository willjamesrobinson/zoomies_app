class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?



  def home
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :age, :gender])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :age, :gender])
  end
end
