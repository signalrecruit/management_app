require 'rails_helper'

RSpec.describe Company::RequirementsController, type: :controller do
  before do 
    @company = FactoryGirl.create :company
    sign_in @company
  end

  def set_requirement
    @requirement = FactoryGirl.create :requirement, company: @company
  end

 
  describe "GET #index" do 
    
    context "successfully" do
      before do 
        5.times { FactoryGirl.create :requirement, company: @company }
        get :index
      end

      it "returns list of job descriptions(requirements" do
        expect(Requirement.all.where(company_id: @company).count).to eq 5  
      end

      it "renders index template" do 
        expect(response).to render_template :index
      end
    end
  end

  describe "GET #new" do 
    
    context "successfully" do 
      before do
        set_requirement 
        get :new
      end 
      
      it "renders template" do 
        expect(response).to render_template :new  
      end 

      it "yields valid requirement object" do 
        expect(assigns[:requirement]).to be_a_new(Requirement)
      end
    end
  end
  
  describe "GET #show" do 

    context "successfully" do 
      before do 
        set_requirement
        get :show, id: @requirement
      end

      it "renders company's requirement" do
        expect(assigns[:requirement].company_id).to eq @company.id   
      end

      it "renders show template" do 
        expect(response).to render_template :show
      end
    end
  end

  describe "POST #create" do 
    before do 
        @requirement_attributes = FactoryGirl.attributes_for :requirement
    end

    context "successfully" do 

      it "create and save company's requirement" do 
        expect{  post :create, { requirement: @requirement_attributes } 
        }.to change(Requirement, :count).by(1)
      end

      it "displays flash message" do 
        post :create, { requirement: @requirement_attributes}
        message = "you have successfully submitted your job description"
        
        expect(flash[:success]).to eq message
      end

      it "redirects to just created requirement" do 
        post :create, { requirement: @requirement_attributes }

        expect(response).to redirect_to company_requirement_url(Requirement.last)
      end
    end

    context "on failure" do 
      
      before do 
        @requirement_attributes[:title] = ""
      end

      it "does not save with invalid attributes" do 
        expect{
          post :create, { requirement: @requirement_attributes }
          }.not_to change(Requirement, :count)
      end

      it "display alert flash message" do 
        post :create, { requirement: @requirement_attributes }
        message = "something went horribly wrong"

        expect(flash[:alert]).to eq message
      end

      it "renders new template" do 
        post :create, { requirement: @requirement_attributes }

        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do 
  
    context "successfully" do 
      before do 
        set_requirement
        get :edit, id: @requirement.id 
      end

      it "should render template" do 
        expect(response).to render_template :edit
      end

      it "" do 
        expect(assigns[:requirement]).to eq @requirement
      end
    end
  end

  describe "PUT/PATCH #update" do 
    
    context "successfully" do 
      before do 
        set_requirement
        patch :update, { id: @requirement.id, requirement: { title: "Chief Software Engineer and Scientist" } }
      end

      it "it updates title" do 
        expect(assigns[:requirement].title).to eq "Chief Software Engineer and Scientist"  
      end

      it "displays success flash message" do 
        message = "you have successfully updated your job description"
        expect(flash[:success]).to eq message  
      end

      it "redirects to updated requirement" do 
        expect(response).to redirect_to company_requirement_url(assigns[:requirement].id)
      end
    end

    context "update failure" do 
      before do 
        set_requirement
        patch :update, { id: @requirement.id, requirement: { experience: "" } }
      end

      it "displays alert flash message" do 
        message = "update failed!"
        expect(flash[:alert]).to eq message
      end

      it "renders edit" do 
        expect(response).to render_template :edit
      end
    end

    describe "DELETE #destroy" do 

      context "successfully" do 
        before do 
          set_requirement 
        end

        it "remove requirement from database" do 
          expect{ delete :destroy, id: @requirement.id 
            }.to change(Requirement, :count).by(-1)
        end

        it "displays notice flash message" do 
          delete :destroy, id: @requirement.id
          message = "Job description successfully deleted."
          expect(flash[:notice]).to eq message
        end

        it "redirect to company_requirements_url" do 
          delete :destroy, id: @requirement.id
          expect(response).to redirect_to company_requirements_url
        end
      end
    end

    describe "GET #send_requirements" do 
      before do 
        set_requirement
        request.env["HTTP_REFERER"] = "origin"
        get :send_requirements, id: @requirement.id
      end

      it "this action assigns true to the requirement attribute sent" do 
        expect(assigns[:requirement].sent).not_to eq nil
      end

      it "displays notice flash message" do 
        message = "Your details have been sent to the recruiter."
        expect(flash[:notice]).to eq message
      end

      it "redirects to :back" do 
        expect(response).to redirect_to "origin"
      end
    end
  end
end
