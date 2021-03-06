class Recruiter::EventsController <  Recruiter::ApplicationController
  before_action :set_applicant_detail, except: [:index, :send_schedule, :pass_interview, :fail_interview, :interview_pending]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :send_schedule, :pass_interview, :fail_interview, :interview_pending]
  layout "recruiter"

  def index
    @events = Event.all
  end

  def show
    index
  end

  def new
    @event = @applicant_detail.build_event
  end

  def create
    @event = @applicant_detail.build_event(event_params)
    @event.company_id = @applicant_detail.requirement.company.id

    if @event.save
      flash[:success] = "successfully created an event"
      redirect_to [:recruiter, @applicant_detail, @event]
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
      redirect_to [:recruiter, @applicant_detail, @event]
    else
      flash[:alert] = "could not update event"
      render :edit
    end
  end

  def destroy
  end

  def send_schedule
    @event.update(sent_by: "Recruiter")
    flash[:success] = "#{@event.applicant_detail.name}'s sent successfully"
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
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "oopss something went wrong"
    redirect_to recruiter_dashboard_url  
  end

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "oopss something went wrong"
    redirect_to recruiter_dashboard_url  
  end

  def event_params
    params.require(:event).permit(:name, :brief_description, :interview_date, :test_date, :confirm, :applicant_detail_id)
  end
end
