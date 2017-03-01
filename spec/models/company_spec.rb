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
  
  describe "test number format of phonenumber" do 
    context "when phonenumber is set to string containing string" do 
      before {  @company.phonenumber = "some string" }
      
      it "@company should be invalid" do 
        expect(@company).not_to be_valid
      end  
    end

    context "when phonenumber is set to string containing numbers" do
      before { @company.phonenumber = "0204704427" }
      
      it "@company should be valid" do 
        expect(@company).to be_valid  
      end  
    end
  end

  # test has_many association 
  it { should have_many :requirements }

end
