class Company::EventsController < Company::ApplicationController
  before_action :set_applicant_detail, except: [:index, :send_schedule, :show, :edit, :update, :confirm_schedule]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :confirm_schedule]
  layout 'company' 

  def index
    @events = Event.all.where(sent: true)
  end

  def show
    index
  end

  def new
    @event = @applicant_detail.build_event
  end

  def create
    @event = @applicant_detail.build_event(event_params)
    # @event.applicant_detail_id = @applicant_detail.id 

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

  def confirm_schedule
    @event.update(confirm: true)
    flash[:success] = "#{@event.applicant_detail.name}'s sent successfully"
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
