class Company::SessionsController < Devise::SessionsController
  layout "welcome"
  
  def new
  	params[:email].present? ? self.resource = resource_class.new(email: params[:email]) : self.resource = resource_class.new(sign_in_params)
  	  
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

   def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    # respond_with resource, location: after_sign_in_path_for(resource)
    redirect_to company_dashboard_path
  end
end
