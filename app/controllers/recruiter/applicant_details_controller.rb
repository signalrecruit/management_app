class Recruiter::ApplicantDetailsController < Recruiter::ApplicationController
  before_action :set_applicant_detail, only: [:show, :edit, :update, :destroy]
  layout "recruiter"

  def index
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


  private 

  def set_applicant_detail
  	@applicant_detail = ApplicantDetail.find(params[:id])
  end

  def applicant_params
  	params.require(:applicant_detail).permit(:name, :email, :phonenumber, :location, :experience, :min_salary,
  		:max_salary, :requirement_id, :qualification_names, :skill_names, :qualification_ids => [], :skill_ids => [])
  end
end
