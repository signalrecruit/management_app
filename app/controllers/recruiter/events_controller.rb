class Recruiter::EventsController < ApplicationController
  before_action :set_applicant_detail
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  layout "recruiter"

  def index
  end

  def show
  end

  def new
    @event = Event.new
    @scheduled_event = @applicant_detail.event
    @all_events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.applicant_detail_id = @applicant_detail.id 

    if @event.save
      flash[:success] = "successfully created an event"
      redirect_to :back
    else
      flash[:alert] = "could not create an event"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def set_applicant_detail
    @applicant_detail = ApplicantDetail.find(params[:applicant_detail_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :brief_description, :interview_date, :test_date, :confirm)
  end
end
