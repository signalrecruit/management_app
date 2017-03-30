class Recruiter::NextOfKinsController < Recruiter::ApplicationController
  before_action :set_employee
  before_action :set_next_of_kin_details, only: [:show, :edit, :update, :destroy, :update_button]	
  layout "recruiter"
  
  def show
  end

  def new
  	@next_of_kin = @employee.next_of_kins.build
  end

  def create
  	@next_of_kin = @employee.next_of_kins.build(kin_params)

  	if @next_of_kin.save
  	  on_success "children details successfully created", recruiter_applicant_detail_employee_url(@employee.applicant_detail, @employee)  
  	else
  	  on_failure "ooops! something went wrong", :new	
  	end
  end

  def edit
  end

  def update
    if @next_of_kin.update(kin_params)
       @next_of_kin.update(update_button: false)	
      on_success "children details updated successfully", :back	
    else
      on_failure "ooops! something went wrong", :back
    end
  end

  def destroy
  	@next_of_kin.destroy
  	on_success "children detail removed successfully", :back
  end

  def update_button
  	@next_of_kin.update(update_button: true)
  	redirect_to :back
  end



  private

  def set_employee
  	@employee = Employee.find(params[:employee_id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
  	redirect_to :back
  end

  def set_next_of_kin_details
    @next_of_kin = @employee.next_of_kins.find(params[:id])
  end

  def kin_params
    params.require(:next_of_kin).permit(:name, :relationship, :phonenumber, :address)
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
