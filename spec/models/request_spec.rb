require 'rails_helper'

RSpec.describe Request, type: :model do
  before { @request = FactoryGirl.build :request }

  subject { @request }

  it { should be_valid }
  
  @request_attributes = [:fullname, :phonenumber, :email, :company, :job_title, :contacted, :accepted_offer]

  # model should respond to attributes
  @request_attributes.each do |attribute|
  	it { should respond_to attribute }
  end

  # test presence of attributes
  [:fullname, :phonenumber, :email, :company, :job_title].each do |attribute|
  	it { should validate_presence_of attribute }
  end

  # validate uniqueness of email
  it { should validate_uniqueness_of(:email).case_insensitive }


  describe "test number format of phonenumber" do 
    context "when phonenumber is set to string containing string" do 
      before {  @request.phonenumber = "some string" }
      
      it "@request should be invalid" do 
        expect(@request).not_to be_valid
      end  
    end

    context "when phonenumber is set to string containing numbers" do
      before { @request.phonenumber = "0204704427" }
      
      it "@request should be valid" do 
        expect(@request).to be_valid  
      end  
    end
  end
  # instance methods
describe "test instance methods" do 
  before { @request.save }

  it "should return true for contact" do 
    @request.contact
    expect(@request.contacted).to eq true 
  end

  it "should return false for no_contact" do 
    @request.no_contact
    expect(@request.contacted).to eq false
  end

  it "should return true for accept_offer" do 
    @request.accept_offer
    expect(@request.accepted_offer).to eq true
  end

  it "should return false for reject_offer" do 
    @request.reject_offer
    expect(@request.accepted_offer).to eq false
  end 
end

end
