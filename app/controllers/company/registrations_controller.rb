class Company::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      # respond_with resource
	  response_to_sign_up_failure resource    
    end
  end

  def after_sign_up_path(resource)
  	if resource == :company
  	  company_dashboard_path
  	end
  end


  private

  def response_to_sign_up_failure(resource)
  	if resource.email == "" && resource.password == nil
  	  redirect_to root_path, alert: "Please fill in the form"
  	elsif Company.pluck(:email).include? resource.email
  	  redirect_to root_path, alert: "email already exists"
    end
  end
end
