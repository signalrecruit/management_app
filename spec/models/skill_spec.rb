require 'rails_helper'

RSpec.describe Skill, type: :model do
  before { @skill = FactoryGirl.build :skill }

  subject { @skill }

  it { should be_valid }
  
  @skill_attributes = [:name, :score]

  @skill_attributes.each do |attribute|
    it { should respond_to attribute }
    it { should validate_presence_of attribute }
  end

  it { should have_and_belong_to_many :requirements }
end
