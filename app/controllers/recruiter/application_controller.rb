class Recruiter::ApplicationController < ApplicationController
  before_action :authorize_recruiter!

  layout "recruiter"
  

  private

  def authorize_recruiter!
  	authenticate_recruiter!

  	unless current_recruiter
  	  redirect_to root_path, alert: "YOU ARE NOT AUTHORIZED! You lack certain permissions to proceed further."
  	end
  end
end
