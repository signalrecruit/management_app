class IdentifierController < ApplicationController
  layout "welcome"

  def identitify
  end


  def authenticate
  	email = params[:email]

  	if Company.all.pluck(:email).include? email
  	  flash[:notice] = "please log in your detais"
  	  redirect_to new_company_session_path(email: "#{email}")
  	elsif Recruiter.all.pluck(:email).include? email
  	  flash[:notice] = "please log in your details"
  	  redirect_to new_recruiter_session_path
  	else
      flash[:notice] = "we don't have a record of you. Please sign up in order to proceed."
      redirect_to root_path
  	end
  end
end
