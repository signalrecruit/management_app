class Company::EmployeesController < Company::ApplicationController
  before_action :set_applicant_detail, except: [:index]
  before_action :set_employee, except: [:index]
  layout 'company'

  def index
  	@employees = current_company.employees.where(sent: true)
  end

  def show
  end

  

 


  private

  def profile_is_completed?(employee)
    employee.is_profile_complete?
  end

  def set_applicant_detail
    @applicant_detail = ApplicantDetail.find(params[:applicant_detail_id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "oopss something went wrong"
    redirect_to recruiter_employees_url
  end

  def set_employee
  	@employee = @applicant_detail.employee
  end

  def employee_params
    params.require(:employee).permit(:surname, :middlename, :firstname, :marital_status, :birthdate, :gender, :birthplace,
      :region, :country, :commencement_date, :position, :department, :postal_address, :city, :house_number, :office_number,
      :mobile_number, :email_address, :corporate_email, :status)
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
