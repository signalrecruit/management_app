class Recruiter::RequirementsController < Recruiter::ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy, :send_requirements]	
  
  layout "recruiter"

  def index
    @requirements = Requirement.only_sent_requirements.order(created_at: :asc)
  end

  def show
  end

  def new
  end

  def edit
  end


  private

  def set_requirement
  	@requirement = Requirement.find(params[:id])
  end

  def set_company
  	@company = Company.find(current_company.id)
  end

  def requirement_params
  	params.require(:requirement).permit(:title, :job_type, :location, :experience, :min_salary, :max_salary,
  		:number_of_vacancies, :note, :company_id, :qualification_names, :skill_names, :qualification_ids => [], :skill_ids => [])
  end
end
