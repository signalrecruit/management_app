class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters

    if resource_class == Recruiter
      devise_parameter_sanitizer.permit(:sign_up, keys: [])
      devise_parameter_sanitizer.permit(:account_update, keys: [])
    elsif resource_class == Company
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phonenumber, :auth_code])    
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phonenumber, :auth_code])
    end
  end

  def after_sign_in_path_for(resource)
    if resource == :company
      company_dashboard_path
    elsif resource == :recruiter
      recruiter_dashboard_path
    end
  end
end
