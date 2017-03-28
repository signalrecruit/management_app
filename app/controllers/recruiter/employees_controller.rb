class Recruiter::EmployeesController < Recruiter::ApplicationController
  before_action :set_applicant_detail, except: [:index]
  before_action :set_employee, except: [:index]

  def index
  	@applicant_details = ApplicantDetail.includes(:event).where(:events => { interview_results: "PASSED" }).all
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


  private

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
      :mobile_number, :email_address, :coporate_email)
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
