class Company::CompulsoryRequirementsController < Company::ApplicationController
  before_action :set_requirement
  before_action :set_compulsory_requirement, only: [:show, :edit, :update, :destroy]
  layout "company"

  def new
  	@compulsory_requirement = @requirement.build_compulsory_requirement
  end

  def create
    @compulsory_requirement = @requirement.build_compulsory_requirement(compulsory_requirement_params)

    if @compulsory_requirement.save
      flash[:success] = "successfully created compulsory requirements"
      redirect_to [:company, @requirement]
    else
      flash[:alert] = "failed to create compulsory requirements"
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @compulsory_requirement.update(compulsory_requirement_params)
      flash[:success] = "update successful"
      redirect_to [:company, @requirement]
    else
      flash[:alert] = "something went wrong. update failed"
      render "edit"  
    end
  end


  
  private

  def set_requirement
  	@requirement = Requirement.find(params[:requirement_id])
  end

  def set_compulsory_requirement
  	@compulsory_requirement = CompulsoryRequirement.find(params[:id])
  end

  def compulsory_requirement_params
    params.require(:compulsory_requirement).permit(:requirement_id, :requirement_1,
     :requirement_2, :requirement_3, :requirement_4, :requirement_5,
      :requirement_6, :requirement_7, :requirement_8, :requirement_9,
       :requirement_10)	
  end
end
