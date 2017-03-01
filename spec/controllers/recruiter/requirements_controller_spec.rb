require 'rails_helper'

RSpec.describe Recruiter::RequirementsController, type: :controller do
  before do 
    @recruiter = FactoryGirl.create :recruiter
    sign_in @recruiter
  end  

  def set_requirement
    @requirement = FactoryGirl.create :requirement
  end
  
  describe "GET #index" do
    before do 
      5.times { FactoryGirl.create :requirement }
      Requirement.update_all(sent: Time.now)
      get :index
    end   

    context "recruiter can view all sent job descriptions(requirements)" do 
      
      it "render the index action" do 
        expect(response).to render_template :index  
      end

      it "displays sent requirements" do 
        expect(assigns[:requirements].count).to eq 5
      end
    end
  end

  describe "GET #show" do 
    
    before do
      set_requirement
      @compulsory_requirement = @requirement.compulsory_requirement
      get :show, id: @requirement.id 
    end  

    context "successfully" do 

      it "render template" do 
        expect(response).to render_template :show
      end

      it "displays requirement" do 
        expect(assigns[:requirement]).to eq @requirement
      end

      it "displays compulsory_requirement" do 
        expect(assigns[:compulsory_requirement]).to eq @compulsory_requirement
      end
    end
  end

  end
