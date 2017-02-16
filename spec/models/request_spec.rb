require 'rails_helper'

RSpec.describe Request, type: :model do
  before { @request = FactoryGirl.build :request }

  subject { @request }

  it { should be_valid }
  
  @request_attributes = [:fullname, :phonenumber, :email, :company, :job_title]

  # model should respond to attributes
  @request_attributes.each do |attribute|
  	it { should respond_to attribute }
  end

  # test presence of attributes
  @request_attributes.each do |attribute|
  	it { should validate_presence_of attribute }
  end
end
