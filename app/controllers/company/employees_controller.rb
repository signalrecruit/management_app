class Company::EmployeesController < Company::ApplicationController
   before_action :set_applicant_detail, except: [:index, :complete, :send_employee_to_company]
  before_action :set_employee, except: [:index, :complete, :send_employee_to_company]
  layout 'company'

  def index
  	@employees = current_company.employees.where(sent: true)
  end

  def show
  end
  
  def new
    @employee = @applicant_detail.build_employee
  end

  def create
    new
    create_employee_from_applicant_detail(@applicant_detail, @employee)
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      on_success "successfully created employee profile", [:recruiter, @applicant_detail, @employee]
    else
      on_failure "oops! something went wrong", [:edit, :recruiter, @applicant_detail, @employee]
    end
  end

  def destroy
  end

  def complete
    @employee = Employee.find(params[:id])
    @employee.update(profile_status: "COMPLETE") if profile_is_completed?(@employee)
    redirect_to recruiter_employees_url
  end

  def send_employee_to_company
    @employee = Employee.find(params[:id])
    @employee.update(sent: true) if @employee.profile_status == "COMPLETE"
    redirect_to recruiter_employees_url
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

  def create_employee_from_applicant_detail(applicant_detail, employee)
    employee.surname = applicant_detail.lastname
    employee.firstname = applicant_detail.firstname
    employee.email_address = applicant_detail.email
    employee.mobile_number = applicant_detail.phonenumber
    employee.position = applicant_detail.job_title
    employee.company_id = applicant_detail.requirement.company_id

    if employee.save
      on_success "please complete employee profile", [:edit, :recruiter, applicant_detail, employee]
    else
      on_failure "oops something went wrong", :back
    end
  end
end
