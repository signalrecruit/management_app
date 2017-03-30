class Recruiter::EmploymentHistoriesController < Recruiter::ApplicationController
  before_action :set_employee
  before_action :set_employment_history, only: [:show, :edit, :update, :destroy, :update_button]
  layout "recruiter"

  def show
  end

  def new
  	@employment_history = @employee.employment_histories.build
  end

  def create
  	@employment_history = @employee.employment_histories.build(employment_params)

  	if @employment_history.save
  	  on_success "employment history created successfully", recruiter_applicant_detail_employee_url(@employee.applicant_detail, @employee)
  	else
  	  on_failure "ooops! something went wrong", :new
  	end
  end

  def edit
  end

  def update
  	if @employment_history.update(employment_params)
  	   @employment_history.update(update_button: false)	
  	  on_success "update of employment history successful", :back
  	else
  	  on_failure "ooopss! something went wrong", :back
  	end
  end

  def destroy
  	@employment_history.destroy
  	on_success "employment history successfully removed", :back
  end

   def update_button
    @employment_history.update(update_button: true)
    redirect_to :back
  end


  private

  def set_employee
  	@employee = Employee.find(params[:employee_id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
  	redirect_to :back
  end

  def set_employment_history
  	@employment_history = @employee.employment_histories.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
  	redirect_to :back
  end

  def employment_params
  	params.require(:employment_history).permit(:organization, :position, :from, :to, :reason_for_leaving)
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
