class Company::ApplicationController < ApplicationController
  before_action :authorize_company!

  layout "company"


  private

  def authorize_company!
  	authenticate_company!

  	unless current_company
  	  redirect_to root_path, alert: "YOU ARE NOT AUTHORIZED! You lack certain permissions to proceed further"
  	end
  end

end
