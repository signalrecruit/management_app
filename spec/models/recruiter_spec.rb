require 'rails_helper'

RSpec.describe Recruiter, type: :model do
  before { @recruiter = FactoryGirl.build :recruiter }

  subject { @recruiter }

  @recruiter_attributes = [:email, :password, :password_confirmation]

  it { should be_valid }

  # model should respond to attributes
  @recruiter_attributes.each do |attribute|
  	it { should respond_to attribute }
  end
end
