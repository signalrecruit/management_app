class RequestsController < ApplicationController

  def new
    @request = Request.new	
  end

  def create
  	@request = Request.new(request_params)
    
    if @request.save
      flash[:success] = "Your successfully made a request for a demo. We will be in touch with you soon"
      redirect_to :back
    else
      flash[:alert] = "Something went wrong. Please submit the request again."
      redirect_to :back  	
    end
  end

  private

  def request_params
  	params.require(:request).permit(:fullname, :phonenumber, :email, :company, :job_title)
  end
end
