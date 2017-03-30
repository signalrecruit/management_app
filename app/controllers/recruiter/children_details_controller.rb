class Recruiter::ChildrenDetailsController < Recruiter::ApplicationController
  before_action :set_employee
  before_action :set_children_details, only: [:show, :edit, :update, :destroy, :update_button]	
  layout "recruiter"
  
  def show
  end

  def new
  	@children_details = @employee.children_details.build
  end

  def create
  	@children_details = @employee.children_details.build(children_params)

  	if @children_details.save
  	  on_success "children details successfully created", recruiter_applicant_detail_employee_url(@employee.applicant_detail, @employee)  
  	else
  	  on_failure "ooops! something went wrong", :new	
  	end
  end

  def edit
  end

  def update
    if @children_details.update(children_params)
       @children_details.update(update_button: false)	
      on_success "children details updated successfully", :back	
    else
      on_failure "ooops! something went wrong", :back
    end
  end

  def destroy
  	@children_details.destroy
  	on_success "children detail removed successfully", :back
  end

  def update_button
  	@children_details.update(update_button: true)
  	redirect_to :back
  end



  private

  def set_employee
  	@employee = Employee.find(params[:employee_id])
  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "could not find the record you were looking for"
  	redirect_to :back
  end

  def set_children_details
    @children_details = @employee.children_details.find(params[:id])
  end

  def children_params
    params.require(:children_detail).permit(:name, :birthdate, :school)
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
