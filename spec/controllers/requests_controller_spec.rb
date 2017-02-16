require 'rails_helper'

RSpec.describe RequestsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do 
    before do
     request.env["HTTP_REFERER"] = "origin" 

     def request_demo(attributes)
       post :create, { request: attributes } 
     end
    end
    
    context "successfully request demo" do 
      before { @request_attributes = FactoryGirl.attributes_for :request }
      
      it "and save request to database" do 
        expect{
          request_demo(@request_attributes)
          }.to change(Request, :count).by(1) 
      end  

      it "and return a success flash message" do 
        request_demo(@request_attributes)
        message = "Your successfully made a request for a demo. We will be in touch with you soon"
        expect(flash[:success]).to eq message
      end

      it "and should redirect to root path" do 
        request_demo(@request_attributes)
        expect(response).to redirect_to "origin"
      end
    end

    context "unsuccessful request for demo" do 
      before do
        @request_invalid_attributes = FactoryGirl.attributes_for :request 
        @request_invalid_attributes[:email] = ""
      end

      it "and should not create and save a request to database" do
      expect{ 
        request_demo(@request_invalid_attributes)
        }.not_to change(Request, :count)
      end

      it "and render a flash message" do 
        request_demo(@request_invalid_attributes)
        message = "Something went wrong. Please submit the request again."
        expect(flash[:alert]).to eq message
      end

      it "and redirects to root path" do 
        request_demo(@request_invalid_attributes)
        expect(response).to redirect_to "origin"
      end
    end
  end
end
