require 'rails_helper'

RSpec.describe Recruiter::RequestsController, type: :controller do

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
