class Recruiter::ScoresController < Recruiter::ApplicationController
  before_action :set_requirement, only: [:new]
  before_action :set_applicant_detail
  before_action :set_score, only: [:show, :edit, :update]
  layout "recruiter"

  def new
  	@score = @applicant_detail.build_score
  end

  def show
  end

  def create
  	@score = @applicant_detail.build_score(score_params)
     @score.score_applicant

  	if @score.save
  	  flash[:success] = "applicant's details successfully scored"
  	  redirect_to [:recruiter, @applicant_detail, @score]
  	else
  	  flash[:alert] = "something went wrong. couldn't score applicant's detail"
  	  render "new"	
  	end
  end

  def edit
  end

  def update
  	if @score.update(score_params) 
  	   @score.score_applicant	
  	  flash[:success] = "applicant's score successfully updated."
  	  redirect_to [:recruiter, @applicant_detail, @score]
  	else
  	  flash[:alert] = "something went wrong. couldn't update applicant's score."
  	  render "edit"	
  	end
  end


  private
  
  def set_requirement
  	@requirement = Requirement.find(params[:requirement_id])
  end

  def set_applicant_detail
  	@applicant_detail = ApplicantDetail.find(params[:applicant_detail_id])
  end

  def set_score
  	@score = Score.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:skills_check, :qualifications_check, :skills_note, :qualifications_note,
    	 :skills_score, :qualifications_score, :total_score, :applicant_detail_id)
  end
end
