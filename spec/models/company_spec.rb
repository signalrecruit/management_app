require 'rails_helper'

RSpec.describe Company, type: :model do
  before { @company = FactoryGirl.build :company }

  subject { @company }

  @company_attributes = [:email, :password, :password_confirmation, :name, :phonenumber, :auth_code]

  it { should be_valid }

  # model should respond to attributes
  @company_attributes.each do |attribute|
  	it { should respond_to attribute }
  end

  # test presence of attributes
  [:email, :password].each do |attribute|
  	it { should validate_presence_of attribute }
  end 


end
