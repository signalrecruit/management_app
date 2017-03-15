class Company::ApplicantDetailsController < Company::ApplicationController
  before_action :set_company, only: [:index]
  before_action :set_applicant_detail, only: [:show, :edit, :update, :accept_applicant, :reject_applicant, :send_recruiter_applicant_details]

  layout 'company'

  def index
    @requirements = @company.requirements
    @applicant_details = []
    @requirements.each do |requirement|
      requirement.applicant_details.where(sent: true).each do |applicant_detail|
      	@applicant_details << applicant_detail
      end	
    end	
    @applicant_details = @applicant_details.uniq
    @applicant_details
  end

  def show
    @requirement = @applicant_detail.requirement
    @score = @applicant_detail.score
  end

  def edit
  end

  def update
  	if @applicant_detail.update(applicant_params)
  	  send_recruiter_applicant_details
  	  # flash[:success] = "update of #{@applicant_detail.name}'s application successful"
  	  # redirect_to :back
  	else 
  	  flash[:alert] = "ooops! something went wrong."
  	  render "edit"
  	end
  end

  def accept_applicant
    @applicant_detail.update(accept: true) if !@applicant_detail.accept?
    flash[:success] = "you have accepted #{@applicant_detail.name}'s application"
    redirect_to :back
  end

  def reject_applicant
    @applicant_detail.update(accept: false) if @applicant_detail.accept?
    flash[:success] = "you have rejected #{@applicant_detail.name}'s application"
    redirect_to :back
  end

  def send_recruiter_applicant_details
    @applicant_detail.update(sent: false)
    flash[:success] = "you have successfully sent #{@applicant_detail.name}'s application to recruiter"
    redirect_to :back
  end

  

  private
  
  def set_company
  	@company = current_company
  end

  def set_applicant_detail
  	@applicant_detail = ApplicantDetail.find(params[:id])
  end

  def applicant_params
  	params.require(:applicant_detail).permit(:reason_for_rejection)
  end
end
