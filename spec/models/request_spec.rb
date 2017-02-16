require 'rails_helper'

RSpec.describe Request, type: :model do
  before { @request = FactoryGirl.build :request }

  subject { @request }

  it { should be_valid }
  
  @request_attributes = [:fullname, :phonenumber, :email, :company, :job_title, :contacted]

  # model should respond to attributes
  @request_attributes.each do |attribute|
  	it { should respond_to attribute }
  end

  # test presence of attributes
  [:fullname, :phonenumber, :email, :company, :job_title].each do |attribute|
  	it { should validate_presence_of attribute }
  end

  # instance methods
describe "test instance methods" do 
  before { @request.save }

  it "should return true for contact" do 
    expect(@request.contact).to eq @request.contacted? 
  end

  it "should return false for no_contact" do 
    expect(@request.no_contact).to eq !@request.contacted
  end
end

end
