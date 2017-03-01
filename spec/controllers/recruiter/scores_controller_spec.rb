require 'rails_helper'

RSpec.describe Recruiter::ScoresController, type: :controller do
  
  before do 
    @recruiter = FactoryGirl.create :recruiter
    sign_in @recruiter
    @applicant_detail = FactoryGirl.create :applicant_detail
  end

  def set_requirement
    @requirement = FactoryGirl.create :requirement
  end

  def set_score 
    @score = FactoryGirl.create :score 
  end

  describe "GET #new" do 
    before { set_requirement }

    context "successfully" do 
      before do 
        get :new, applicant_detail_id: @applicant_detail.id, requirement_id: @requirement.id
      end

      it "renders new template" do 
        expect(response).to render_template :new
      end

      it "associate @applicant_detail with @requirement by updating requirement_id" do 
        @applicant_detail.update(requirement_id: @requirement.id)  
        expect(@applicant_detail.requirement_id).to eq @requirement.id
      end

      it "yield a valid score object" do 
        expect(assigns[:score]).to be_a_new(Score)
      end
    end
  end

  describe "GET #show" do 
    before { set_score }

    context "successfully" do 
      before do 
        get :show, applicant_detail_id: @applicant_detail.id, id: @score.id
      end

      it "render show template" do 
        expect(response).to render_template :show
      end

      it "display score of applicant_detail" do
        expect(assigns[:score]).to eq @score
      end 

      it "display applicant_detail" do 
        expect(assigns[:applicant_detail]).to eq @applicant_detail
      end
    end
  end

  describe "POST #create" do 

    context "successfully" do 
      before do 
        @score_attributes = FactoryGirl.attributes_for :score
      end

      it "create and save score in database" do 
        expect{
          post :create, { applicant_detail_id: @applicant_detail, score: @score_attributes }
        }.to change(Score, :count).by(1)
      end

      it "display success flash message" do 
        post :create, { applicant_detail_id: @applicant_detail, score: @score_attributes }
        message = "applicant's details successfully scored"
        expect(flash[:success]).to eq message
      end

      it "redirects to applicants' score just created" do 
        post :create, { applicant_detail_id: @applicant_detail.id, score: @score_attributes }
        expect(response).to redirect_to recruiter_applicant_detail_score_url(@applicant_detail, Score.last)
      end

      it "score must belong to applicant_detail" do
        post :create, { applicant_detail_id: @applicant_detail, score: @score_attributes }
        expect(assigns[:score].applicant_detail_id).to eq @applicant_detail.id
      end
    end
    # failure validation not applicable yet. Score model currently has no validation
  end

  describe "GET #edit" do 
    before do
      set_requirement 
      set_score
      get :edit, applicant_detail_id: @applicant_detail.id, requirement_id: @requirement.id, id: @score.id
    end

    it "renders edit template" do 
      expect(response).to render_template :edit
    end
  end

  describe "PUT/PATCH #update" do
    before do 
      set_score
    end

    context "successfully" do 
      before do 
        patch :update, { applicant_detail_id: @applicant_detail.id, id: @score.id, score: { skills_check: true, qualifications_check: true, skills_score: 1, qualifications_score: 1 } }
      end

      it "updates qualifications_score to 1.0" do 
        expect(assigns[:score].qualifications_score).to eq 1.0
      end

      it "updates skill_check to true" do 
        expect(assigns[:score].skills_check).to eq true
      end

      it "displays success flash message" do 
        message = "applicant's score successfully updated."
        expect(flash[:success]).to eq message
      end

      it "redirects to updated score" do 
        expect(response).to redirect_to recruiter_applicant_detail_score_url(@applicant_detail, @score)
      end
    end
  end
end
