class Recruiter::ScoresController < Recruiter::ApplicationController
  before_action :set_requirement, only: [:new, :edit]
  before_action :set_applicant_detail
  before_action :set_score, only: [:show, :edit, :update]
  layout "recruiter"

  def new
    @applicant_detail.update(requirement_id: @requirement.id, company_id: @requirement.company.id) #must associate applicant with requirement by updating requirement_id
    @requirement.update_vacancies_left
    @score = @applicant_detail.build_score
  end

  def show
    @requirement = @applicant_detail.requirement
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
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "oopss something went wrong"
    redirect_to recruiter_dashboard_url  
  end

  def score_params
    params.require(:score).permit(:skills_check, :qualifications_check, :skills_note, :qualifications_note,
    	 :skills_score, :qualifications_score, :total_score, :applicant_detail_id, :requirement_1_check, 
       :requirement_2_check, :requirement_3_check, :requirement_4_check, :requirement_5_check, :requirement_6_check,
        :requirement_7_check, :requirement_8_check, :requirement_9_check, :requirement_10_check, :requirement_1_score, 
        :requirement_2_score, :requirement_3_score, :requirement_4_score, :requirement_5_score, :requirement_6_score,
         :requirement_7_score, :requirement_8_score, :requirement_9_score, :requirement_10_score, :requirement_total_score)
  end
end
