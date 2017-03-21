class Recruiter::RequestsController < Recruiter::ApplicationController
  before_action :set_request, only: [:contact, :no_contact, :send_company_login_details, :accept_offer, :reject_offer]

  layout "recruiter"

  # def new
  #   @request = Request.new  
  # end

  def create
    @request = Request.new(request_params)
    
    if @request.save
      flash[:success] = "Demo request successfully created for #{@request.fullname}."
      redirect_to :back
    else
      flash[:alert] = "Something went wrong. Please submit the request again."
      redirect_to :back   
    end
  end

  def demo_requests
  	@requests = Request.all.order(created_at: :desc)
  end

  def contact
  	@request.contact
  	redirect_to :back
  end

  def no_contact
    if Company.all.pluck(:email).include? @request.email
      flash[:alert] = "account has already been created. This action is not permissible"
    else
      @request.no_contact 
    end
    redirect_to :back
  end

  def send_company_login_details
     if @request.contacted? && @request.accepted_offer?
       create_company_account(@request)
     elsif !@request.contacted? && @request.accepted_offer.nil?
       flash[:alert] = "#{@request.fullname} has not accepted the offer yet!"
     elsif @request.contacted? && @request.accepted_offer.nil?
        flash[:alert] = "#{@request.fullname} has neither accepted nor rejected the offer yet"
     elsif @request.contacted? && !@request.accepted_offer?
        flash[:alert] = "#{@request.fullname} rejected the offer. You can't send him an email."         
     end
     redirect_to :back 
  end

  def accept_offer
    if @request.contacted?
      @request.accept_offer
      flash[:notice] = "this means #{@request.fullname} has accepted the offer to try out demo."
    else
      flash[:alert] = "you have not contacted #{@request.fullname}. Therefore his action is not permissible."
    end
    redirect_to :back
  end

  def reject_offer
    if @request.contacted? && @request.accepted_offer.nil?
      @request.reject_offer
      flash[:notice] = "this means #{@request.fullname} declined on the offer to try out demo."
    elsif @request.contacted? && @request.accepted_offer? && (!Company.all.pluck(:email).include? @request.email)
      @request.reject_offer
       flash[:notice] = "this means #{@request.fullname} declined on the offer to try out demo."
    elsif !@request.contacted?
      flash[:alert] = "you have not contacted #{@request.fullname}. Therefore his action is not permissible."
    elsif Company.all.pluck(:email).include? @request.email
      flash[:alert] = "account has already been created. This action is not permissible."
    end
    redirect_to :back
  end

  
  private

  def request_params
    params.require(:request).permit(:fullname, :phonenumber, :email, :company, :job_title, :contacted, :accepted_offer)
  end

  def set_request
    @request = Request.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "oopss something went wrong"
    redirect_to recruiter_dashboard_url  
  end

  def create_company_account(request)
    @secure_password = SecureRandom.hex(5)
    @company = Company.new do |company|
      company.name = request.company
      company.email = request.email
      company.password = @secure_password
      company.password_confirmation = @secure_password
      company.phonenumber = request.phonenumber
      company.auth_code = Devise.friendly_token

      if company.save
        # CompanySignupMailer.signup_company(@company, @url).deliver_later
         CompanySignupJob.set(wait: 2.seconds).perform_later(company, @secure_password, new_company_session_url(email: company.email))
        flash[:notice] = "company account has been created for #{request.company} and an email has been sent."
      elsif Company.all.pluck(:email).include? company.email
        flash[:alert] = "An account with the email #{company.email} already exists. Company account could not be created."
      end
    end
  end
end
