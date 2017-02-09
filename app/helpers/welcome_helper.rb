module WelcomeHelper
  def resource
  	@company ||= Company.new
  end

  def resource_name
  	:company
  end

  def registration_path(resource_name)
  	company_registration_path
  end

  def devise_mapping
  	@devise_mapping ||= Devise.mappings[:company]
  end
end
