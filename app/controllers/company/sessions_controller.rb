class Company::SessionsController < Devise::SessionsController
  
  def new
  	params[:email].present? ? self.resource = resource_class.new(email: params[:email]) : self.resource = resource_class.new(sign_in_params)
  	  
    clean_up_passwords(resource)
    yield resource if block_given?
    # respond_with(resource, serialize_options(resource))
    redirect_to company_dashboard_path
  end
end
