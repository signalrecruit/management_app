class Recruiter::ManageCompaniesController < Recruiter::ApplicationController
  before_action :set_company, only: [:company_job_descriptions, :company_history_of_applicants]
  layout "recruiter"
  
  def show
  end

  def list_of_companies
  	@companies = Company.all.order(created_at: :asc)
  end

  def remove_company
  end

  def company_job_descriptions
    @requirements = @company.requirements
  end

  def company_history_of_applicants
    @applicant_details = []
    @requirements = @company.requirements
    @requirements.each do |requirement|
      requirement.applicant_details.each do|applicant|
        @applicant_details << applicant
      end
      @applicant_details = @applicant_details.uniq 
    end
    @applicant_details
  end

  
  private

  def company_params
    params.require(:company).permit(:name, :phonenumber, :email, :password, :auth_code)	
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
