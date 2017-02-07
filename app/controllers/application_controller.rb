class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phonenumber, :auth_code])
    
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phonenumber, :auth_code])
  end

  # def after_sign_in_path_for(resource)
  #   if current_user.admin?
  #     admin_root_path
  #   elsif current_user.seller?
  #     my_shops_path
  #   elsif !current_user.seller?
  #     root_path
  #   end
  # end
end
