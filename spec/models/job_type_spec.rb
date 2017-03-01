require 'rails_helper'

RSpec.describe JobType, type: :model do
  before { @job_type = FactoryGirl.build :job_type }

  subject { @job_type }

  it { should be_valid }

  # test HABTM association
  it { should have_and_belong_to_many :requirements }
 
  # should respond to attribute

  it { should respond_to :name }


end
