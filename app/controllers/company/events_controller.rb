class Company::EventsController < Company::ApplicationController
  # before_action :set_applicant_detail, except: [:index, :send_schedule, :show, :edit, :update, :confirm_schedule]
  before_action :set_applicant_detail, only: [:new]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :confirm_schedule, :choose_recruiter,
    :choose_company, :pass_interview, :fail_interview, :interview_pending, :reject_schedule]
  layout 'company' 

  def index
    @events = Event.all.where(company_id: "#{current_company.id}")  
  end

  def show
    index
  end

  def new
    @event = @applicant_detail.build_event
  end

  def create
    @event = @applicant_detail.build_event(event_params)

    if @event.save
      flash[:success] = "successfully created an event"
      redirect_to [:company, @applicant_detail, @event]
    else
      flash[:alert] = "could not create an event"
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:success] = "successfully updated event"
      redirect_to [:company, @event]
    else
      flash[:alert] = "could not update event"
      render :edit
    end
  end

  def destroy
  end

  # move these methods into it's own controller
  def confirm_schedule
    @event.update(confirm: "Confirmed")
    flash[:success] = "#{@event.applicant_detail.name}'s sent successfully"
    redirect_to :back
  end

  def reject_schedule
    @event.update(confirm: "Rejected")
    flash[:success] = "please setup a schedule for #{@event.applicant_detail.name}'s interview/test"
    redirect_to [:edit, :company, @event]
  end

  def choose_recruiter
    @event.update(scheduler: "Recruiter")
    flash[:success] = "recruiter will be notified to set up the interview"
    redirect_to :back
  end

  def choose_company
    @event.update(scheduler: "#{current_company.name}")
    flash[:success] = "please set up the interview/test and communicate results back to recruiter"
    redirect_to :back
  end

  def pass_interview
    @event.update(interview_results: "PASSED")
    flash[:success] = "#{@event.applicant_detail.name} passed the interview/test"
    redirect_to :back
  end

  def fail_interview
    @event.update(interview_results: "FAILED")
    flash[:success] = "#{@event.applicant_detail.name} failed the interview/test"
    redirect_to :back
  end

  def interview_pending
    @event.update(interview_results: "PENDING")
    flash[:success] = "#{@event.applicant_detail.name}'s interview pending"
    redirect_to :back
  end
  


  private

  def set_applicant_detail
    @applicant_detail = ApplicantDetail.find(params[:applicant_detail_id])
  end

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "could not find the resource you were looking for"
    redirect_to company_dashboard_url
  end

  def event_params
    params.require(:event).permit(:name, :brief_description, :interview_date, :test_date, :confirm, :applicant_detail_id)
  end
end
