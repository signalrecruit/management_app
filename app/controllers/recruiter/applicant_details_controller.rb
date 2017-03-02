class Recruiter::ApplicantDetailsController < Recruiter::ApplicationController
  before_action :set_applicant_detail, only: [:show, :edit, :update, :destroy, :match_job_description, :send_company_applicant_details]
  layout "recruiter"

  def index
  	@applicant_details = ApplicantDetail.all.order(created_at: :asc)
  end

  def show
  end

  def new
  	@applicant_detail = ApplicantDetail.new
  end

  def create
    @applicant_detail = ApplicantDetail.new(applicant_params)	

    if @applicant_detail.save
      flash[:success] = "application successfully created."
      redirect_to [:recruiter, @applicant_detail]
   else
   	  flash[:alert] = "something went wrong. could not create application"
   	  render "new"
    end
  end

  def edit
  end

  def update
  	if @applicant_detail.update(applicant_params)
  	  flash[:success] = "application successfully updated."
  	  redirect_to [:recruiter, @applicant_detail]
  	else
  	  flash[:alert] = "something went wrong. update failed"
  	  render "edit"
  	end
  end

  def destroy
  end

  def match_job_description
  	@requirements = Requirement.all.uniq
  end

  def send_company_applicant_details
    @applicant_detail.update(sent: true)
    flash[:success] = "you have successfully sent #{@applicant_detail.name}'s application details to #{@applicant_detail.requirement.company.name}"
    redirect_to :back
  end

 
  private 

  def set_applicant_detail
  	@applicant_detail = ApplicantDetail.find(params[:id])
  end

  def applicant_params
  	params.require(:applicant_detail).permit(:name, :email, :phonenumber, :location, :experience, :min_salary,
  		:max_salary, :job_title, :sent, :requirement_id, :qualification_names, :skill_names, :job_type_names, :job_type_ids => [], :qualification_ids => [], :skill_ids => [])
  end
end
