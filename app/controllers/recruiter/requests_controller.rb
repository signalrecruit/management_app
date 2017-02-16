class Recruiter::RequestsController < ApplicationController
  before_action :set_request, only: [:contact, :no_contact]

  layout "recruiter"

  def demo_requests
  	@requests = Request.all.order(created_at: :desc)
  end

  def contact
  	@request.contact
  	redirect_to :back
  end

  def no_contact
    @request.no_contact
    redirect_to :back
  end

  
  private

  def set_request
    @request = Request.find(params[:id])
  end
end
