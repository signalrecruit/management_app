class Company::RequirementsController < ApplicationController
   before_action :set_requirement, only: [:show, :edit, :update, :destroy]
   before_action :set_company, only: [:create]
   layout "company"

  def index
  	@requirements = Requirement.all.order(created_at: :asc)
  end

  def new
    @requirement = Requirement.new
  end
  
  def show
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


  private

  def set_requirement
  	@requirement = Requirement.find(params[:id])
  end

  def set_company
  	@company = Company.find(current_company.id)
  end

  def requirement_params
  	params.require(:requirement).permit(:title, :job_type, :location, :experience, :min_salary, :max_salary,
  		:number_of_vacancies, :note, :company_id, :qualification_ids => [], :skill_ids => [])
  end
end
