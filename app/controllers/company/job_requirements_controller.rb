class Company::JobRequirementsController < Company::ApplicationController
  layout "company"

  def new
    @job_requirement = JobRequirement.new
  end
  
  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def set_requirements
  end

  def requirement_params
  end
end
