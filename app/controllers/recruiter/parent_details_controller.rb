class Recruiter::ParentDetailsController < Recruiter::ApplicationController
  before_action :set_employee
  before_action :set_parent_details, only: [:show, :edit, :update, :destroy, :update_button]	
  layout "recruiter"
  
  def show
  end

  def new
  	@parent_details = @employee.parent_details.build
  end

  def create
  	@parent_details = @employee.parent_details.build(children_params)

  	if @parent_details.save
  	  on_success "children details successfully created", recruiter_applicant_detail_employee_url(@employee.applicant_detail, @employee)  
  	else
  	  on_failure "ooops! something went wrong", :new	
  	end
  end

  def edit
  end

  def update
    if @parent_details.update(children_params)
       @parent_details.update(update_button: false)	
      on_success "parent details updated successfully", :back	
    else
      on_failure "ooops! something went wrong", :back
    end
  end

  def destroy
  	@parent_details.destroy
  	on_success "parent detail removed successfully", :back
  end

  def update_button
  	@parent_details.update(update_button: true)
  	redirect_to :back
  end



  private

  def set_employee
  	@employee = Employee.find(params[:employee_id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
  	redirect_to :back
  end

  def set_parent_details
    @parent_details = @employee.parent_details.find(params[:id])
  end

  def children_params
    params.require(:parent_detail).permit(:name, :birthdate, :status)
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
