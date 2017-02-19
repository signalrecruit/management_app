class Recruiter::ManageCompaniesController < Recruiter::ApplicationController
  layout "recruiter"

  def list_of_companies
  	@companies = Company.all.order(created_at: :asc)
  end

  def remove_company
  end

  
  private

  def set_company
    params.require(:company).permit(:name, :phonenumber, :email, :password, :auth_code)	
  end
end
