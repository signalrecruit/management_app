require 'rails_helper'

RSpec.describe CompulsoryRequirement, type: :model do
  before do 
  	q1 = FactoryGirl.create :qualification
  	q2 = FactoryGirl.create :qualification
  	s1 = FactoryGirl.create :skill
  	s2 = FactoryGirl.create :skill
    j1 = FactoryGirl.create :job_type
    @requirement = FactoryGirl.create :requirement, :job_type_ids => [j1.id], :qualification_ids => [q1.id, q2.id], :skill_ids => [s1.id, s2.id] 
    @compulsory_requirement = FactoryGirl.build :compulsory_requirement, requirement: @requirement 
  end 
  
  subject { @compulsory_requirement }


  @compulsory_requirement_attributes = [:requirement_id, :requirement_1, 
     :requirement_2,  :requirement_3,  :requirement_4,  :requirement_5, 
      :requirement_6,  :requirement_7,  :requirement_8,  :requirement_9, 
       :requirement_10]

  @compulsory_requirement_attributes.each do |attribute|
    it { should respond_to attribute }
  end 

  it { should belong_to :requirement }
  it { should be_valid }
end
