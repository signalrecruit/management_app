class Company::RequirementsController < Company::ApplicationController
   before_action :set_requirement, only: [:show, :edit, :update, :destroy, :send_requirements]
   before_action :set_company, only: [:index, :create]
   layout "company"

  def index
  	@requirements = @company.requirements.all.order(created_at: :asc)
  end

  def new
    @requirement = Requirement.new
  end
  
  def show
    @compulsory_requirement = @requirement.compulsory_requirement
  end

  def create
  	@requirement = Requirement.new(requirement_params)
    @requirement.company_id = @company.id


  	if @requirement.save
  	  flash[:success] = "you have successfully submitted your job description"
  	  redirect_to [:company, @requirement]
  	else
  	  flash[:alert] = "something went horribly wrong"
  	  render :new	
  	end
  end

  def edit
  end

  def update
  	if @requirement.update(requirement_params)
  	  flash[:success] = "you have successfully updated your job description"
  	  redirect_to [:company, @requirement]
  	else
  	  flash[:alert] = "update failed!"
  	  render "edit"	
  	end
  end

  def destroy
  	@requirement.destroy
  	flash[:notice] = "Job description successfully deleted."
  	redirect_to company_requirements_url
  end

  def send_requirements
    # send email
    @requirement.send_requirements
    flash[:notice] = "Your details have been sent to the recruiter for review."
    redirect_to :back
  end
  

  private

  def set_requirement
  	@requirement = Requirement.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "oopss something went wrong"
    redirect_to company_dashboard_url
  end

  def set_company
  	@company = Company.find(current_company.id)
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "oopss something went wrong"
    redirect_to company_dashboard_url  
  end

  def requirement_params
  	params.require(:requirement).permit(:title, :location, :experience, :min_salary, :max_salary,
  		:number_of_vacancies, :note, :company_id, :qualification_names, :job_type_names, :skill_names, :job_type_ids => [], :qualification_ids => [], :skill_ids => [])
  end
end
