require 'rails_helper'

RSpec.describe Recruiter::RequestsController, type: :controller do
  before do 
    @recruiter = FactoryGirl.create :recruiter
    sign_in @recruiter
  end
  
  # NOTE: get :new can't be tested in controller because it's being handled 
  # by a modal which is called by a simple HTML button, and no references to
  # to use of link_to helper

  describe "POST #create" do 
    before { request.env["HTTP_REFERER"] = "origin" }

    context "create a request successfully" do 
      before { @request_attributes = FactoryGirl.attributes_for :request }

      it "should create and save request successfully" do 
        expect{
          post :create, { request: @request_attributes }
        }.to change(Request, :count).by(1)   
      end

      it "should display flash message on redirect" do 
        post :create, { request: @request_attributes }
        message = "Demo request successfully created for #{assigns[:request].fullname}."
        expect(flash[:success]).to eq message
      end

      it "should successfully redirect to previous page" do
        post :create, { request: @request_attributes } 
        expect(response).to redirect_to "origin"   
      end
    end  

    context "unsucceful attempt to create request" do 
      before do 
        @invalid_attributes = FactoryGirl.attributes_for :request 
        @invalid_attributes[:email] = ""
      end

      it "should not save request" do 
        expect{
          post :create, { request: @invalid_attributes }
        }.not_to change(Request, :count)  
      end

      it "should display alert flash message" do 
        post :create, { request: @invalid_attributes }
        message = "Something went wrong. Please submit the request again."
        expect(flash[:alert]).to eq message
      end

      it "should redirect to previous page" do 
        post :create, { request: @invalid_attributes }
        expect(response).to redirect_to "origin"
      end
    end
  end

  describe "GET #demo_requests" do 
    context "return demo_requests" do 
      before do
        5.times { FactoryGirl.create :request, contacted: true }
        get :demo_requests
      end	

      it "render demo_requests template" do 
        expect(response).to render_template :demo_requests	
      end

      it "returns all request with contacted true" do 
        expect(assigns[:requests].size).to eq 5	
      end
    end
  end

  describe "PUT/PATCH #contact" do
  	context "successfully update request" do 
  	  before do
  	  	request.env["HTTP_REFERER"] = "origin"
  	    @demo_request = FactoryGirl.create :request, contacted: false	     
  	    patch :contact, { id: @demo_request.id, request: { contacted: true } }
  	    @demo_request.reload
  	  end

  	  it "should change value of contacted to true" do 
  	    expect(@demo_request.contacted?).to eq true	
  	  end

  	  it "should redirect to previous page" do 
        expect(response).to redirect_to "origin"
  	  end
    end
 end

 describe "PUT/PATCH #no_contact" do 
   context "successfully update request" do 
     before do 
       request.env["HTTP_REFERER"] = "origin"
       @demo_request = FactoryGirl.create :request, contacted: true
       patch :no_contact, { id: @demo_request.id, request: { contacted: false } }
       @demo_request.reload	
     end

     it "should chang value of contacted to false" do 
       expect(@demo_request.contacted).to eq false
     end	

     it "should redirect to previous page" do 
       expect(response).to redirect_to "origin" 	
     end
   end
 end
end
