require 'rails_helper'

RSpec.describe IdentifierController, type: :controller do
  before do 
  	@company = FactoryGirl.create :company
  	@recruiter = FactoryGirl.create :recruiter
  end
  
  describe "GET #identify" do 
  	context "successfully" do 
  	  before do 
  	    get :identify			    
  	  end	

  	  it "should render identify template" do 
  	  	expect(response).to render_template :identify
  	  end
  	end
  end

  describe "POST #authenticate using email" do 
  	context "authenticate company" do
  	  before do  
        params = { email: @company.email }
        post :authenticate, params
      end

      it "should redirect to new_company_session_path" do 
        expect(response).to redirect_to new_company_session_url(email: @company.email)	
      end

      it "should display flash message" do 
      	message = "please log in your details"
      	expect(flash[:notice]).to eq message
      end
  	end

  	context "authenticate recruiter" do 
      before do 
      	params = { email: @recruiter.email }
      	post :authenticate, params
      end		

      it "should redirect to new_recruiter_session_path" do 
      	expect(response).to redirect_to new_recruiter_session_url(email: @recruiter.email)
      end
  	end
  end

end
