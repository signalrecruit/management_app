require 'rails_helper'

RSpec.describe Qualification, type: :model do
  before { @qualification = FactoryGirl.build :qualification }

  subject { @qualification }

  it { should be_valid }
  
  @qualification_attributes = [:name, :score]

  @qualification_attributes.each do |attribute|
    it { should respond_to attribute }
    it { should validate_presence_of attribute }
  end

  it { should have_and_belong_to_many :requirements }
  it { should have_and_belong_to_many :applicant_details }
end
