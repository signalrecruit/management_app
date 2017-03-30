class Recruiter::SalaryDetailsController < Recruiter::ApplicationController
  before_action :set_employee
  before_action :set_salary_details, only: [:show, :edit, :update, :destroy, :update_button]	
  layout "recruiter"
  
  def show
  end

  def new
  	@salary_details = @employee.build_salary_detail
  end

  def create
  	@salary_details = @employee.build_salary_detail(salary_params)

  	if @salary_details.save
  	  on_success "spouse details successfully created", recruiter_applicant_detail_employee_url(@employee.applicant_detail, @employee)  
  	else
  	  on_failure "ooops! something went wrong", :new	
  	end
  end

  def edit
  end

  def update
    if @salary_details.update(salary_params)
       @salary_details.update(update_button: false)	
      on_success "spouse details updated successfully", :back	
    else
      on_failure "ooops! something went wrong", :back
    end
  end

  def destroy
  	@salary_details.destroy
  	on_success "spouse detail removed successfully", :back
  end

  def update_button
  	@salary_details.update(update_button: true)
  	redirect_to :back
  end



  private

  def set_employee
  	@employee = Employee.find(params[:employee_id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
  	redirect_to :back
  end

  def set_salary_details
    @salary_details = @employee.salary_detail
  end

  def salary_params
    params.require(:salary_detail).permit(:bankname, :branch, :account_number, :ssnit_number)
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
