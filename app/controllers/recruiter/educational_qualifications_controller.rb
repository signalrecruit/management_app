class Recruiter::EducationalQualificationsController < Recruiter::ApplicationController
  before_action :set_employee
  before_action :set_educational_qualification, only: [:show, :edit, :update, :destroy, :update_button]
  layout "recruiter"

  def show
  end

  def new
  	@educational_qualification = @employee.educational_qualifications.build
  end

  def create
  	@educational_qualification = @employee.educational_qualifications.build(qualification_params)

  	if @educational_qualification.save
  	  on_success "successfully added educational qualification", recruiter_applicant_detail_employee_url(@employee.applicant_detail, @employee)
  	else
  	  on_failure "oops!", :new
  	end
  end

  def edit
  end

  def update
  	if @educational_qualification.update(qualification_params)
  	  @educational_qualification.update(update_button: false)	
      on_success "update successfully done", :back
    else
      on_failure "ooops! something went wrong", :back	
  	end
  end

  def destroy
  	@educational_qualification.destroy
  	on_success "delete successfully done", :back
  end

  def update_button
    @educational_qualification.update(update_button: true)
    redirect_to :back
  end


  private

  def set_employee
  	@employee = Employee.find(params[:employee_id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
  	redirect_to :back
  end

  def set_educational_qualification
  	@educational_qualification = @employee.educational_qualifications.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
    redirect_to :back 
  end

  def qualification_params
  	params.require(:educational_qualification).permit(:institution, :certificate, :enrolled_at, :completed_at)
  end

   def on_success(msg, path)
    flash[:success] = msg
    redirect_to path
  end

  def on_failure(msg, path)
    flash[:error] = msg
    render path
  end
end
