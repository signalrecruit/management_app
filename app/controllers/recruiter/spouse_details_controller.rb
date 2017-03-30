class Recruiter::SpouseDetailsController < Recruiter::ApplicationController
  before_action :set_employee
  before_action :set_spouse_details, only: [:show, :edit, :update, :destroy, :update_button]	
  layout "recruiter"
  
  def show
  end

  def new
  	@spouse_details = @employee.build_spouse_detail
  end

  def create
  	@spouse_details = @employee.build_spouse_detail(spouse_params)

  	if @spouse_details.save
  	  on_success "spouse details successfully created", recruiter_applicant_detail_employee_url(@employee.applicant_detail, @employee)  
  	else
  	  on_failure "ooops! something went wrong", :new	
  	end
  end

  def edit
  end

  def update
    if @spouse_details.update(spouse_params)
       @spouse_details.update(update_button: false)	
      on_success "spouse details updated successfully", :back	
    else
      on_failure "ooops! something went wrong", :back
    end
  end

  def destroy
  	@spouse_details.destroy
  	on_success "spouse detail removed successfully", :back
  end

  def update_button
  	@spouse_details.update(update_button: true)
  	redirect_to :back
  end



  private

  def set_employee
  	@employee = Employee.find(params[:employee_id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
  	redirect_to :back
  end

  def set_spouse_details
    @spouse_details = @employee.spouse_detail
  end

  def spouse_params
    params.require(:spouse_detail).permit(:name, :birthdate, :profession, :phonenumber, :address)
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
