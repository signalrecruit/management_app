require 'rails_helper'

RSpec.describe Recruiter::ApplicantDetailsController, type: :controller do
  before do 
    @recruiter = FactoryGirl.create :recruiter
    sign_in @recruiter
  end

  def set_applicant_detail
    @applicant_detail = FactoryGirl.create :applicant_detail
  end

  describe "GET #index" do 

    context "successfully" do 

      before do 
        5.times { FactoryGirl.create :applicant_detail }
        get :index
      end

      it "render index template" do 
        expect(response).to render_template :index  
      end
      
      it "return all details of applicants" do 
        expect(assigns[:applicant_details].count).to eq 5
      end
    end
  end

  describe "GET #show" do 
    
    context "successfully" do 
      before do 
        set_applicant_detail
        get :show, id: @applicant_detail
      end

      it "should display applicant's detail" do 
        expect(assigns[:applicant_detail]).to eq @applicant_detail
      end

      it "should render show template" do 
        expect(response).to render_template :show
      end
    end 
  end

  describe "GET #new" do 

    context "successfully" do 
      before { get :new }

      it "render template" do 
        expect(response).to render_template :new
      end
    end
  end

  describe "POST #create" do 

    context "successfully" do 
      before do
        @applicant_detail_attributes = FactoryGirl.attributes_for :applicant_detail
      end

      it "should create and save applicant" do 
        expect{
          post :create, { applicant_detail: @applicant_detail_attributes }
        }.to change(ApplicantDetail, :count).by(1)
      end

      it "should display flash message" do 
        message = "application successfully created."
        post :create, { applicant_detail: @applicant_detail_attributes }
        expect(flash[:success]).to eq message
      end

      it "should redirect to applicant_detail just created" do 
        post :create, { applicant_detail: @applicant_detail_attributes }

        expect(response).to redirect_to recruiter_applicant_detail_url(assigns[:applicant_detail].id)
      end
    end

    context "unsuccessfully" do 

      before do 
        @invalid_attributes = FactoryGirl.attributes_for :applicant_detail
        @invalid_attributes[:name] = ""
      end

      it "applicant details not saved" do 
        expect{
          post :create, { applicant_detail: @invalid_attributes }
        }.not_to change(ApplicantDetail, :count)
      end

      it "displays alert flash messgae" do 
        post :create, { applicant_detail: @invalid_attributes }

        message = "something went wrong. could not create application"
        expect(flash[:alert]).to eq message
      end

      it "should render new template" do 
        post :create, { applicant_detail: @invalid_attributes }

        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do 
    before do 
      set_applicant_detail
    end

    context "successfully" do 
      before do 
        get :edit, id: @applicant_detail.id
      end

      it "renders edit template" do 
        expect(response).to render_template :edit
      end
    end
  end

  describe "PUT/PATCH #update" do 
    before do 
      set_applicant_detail
    end

    context "successfully" do 
      before { patch :update, { id: @applicant_detail.id, applicant_detail: { name: "Paa Yaw" } } }
      
      it "it updates name" do 
        expect(assigns[:applicant_detail].name).to eq "Paa Yaw"
      end

      it "displays flash success message" do 
        message = "application successfully updated."
        expect(flash[:success]).to eq message
      end

      it "should redirect to updated applicant's detail" do 
        expect(response).to redirect_to recruiter_applicant_detail_url(@applicant_detail.id)
      end
    end

    context "update failed" do 
      before do 
        patch :update, { id: @applicant_detail.id, applicant_detail: { experience: ""} }
      end

      it "should display alert flash message" do 
        message = "something went wrong. update failed"
        expect(flash[:alert]).to eq message
      end

      it "renders edit template" do 
        expect(response).to render_template :edit
      end
    end
  end

  describe "GET #match_job_description" do 
    before { set_applicant_detail }

    context "successfully" do 
      before do
        5.times { FactoryGirl.create :requirement }
        get :match_job_description, id: @applicant_detail.id
      end

      it "should render match_job_description template" do 
        expect(response).to render_template :match_job_description
      end

      it "display applicant details" do 
        expect(assigns[:applicant_detail]).to eq @applicant_detail
      end

      it "displays 5 requirements" do 
        expect(assigns[:requirements].uniq.count).to eq 5
      end
    end
  end
end
