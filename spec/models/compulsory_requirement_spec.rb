require 'rails_helper'

RSpec.describe CompulsoryRequirement, type: :model do
  before do 
  	q1 = FactoryGirl.create :qualification
  	q2 = FactoryGirl.create :qualification
  	s1 = FactoryGirl.create :skill
  	s2 = FactoryGirl.create :skill
    @requirement = FactoryGirl.build :requirement, :qualification_ids => [q1.id, q2.id], :skill_ids => [s1.id, s2.id] 
    @compulsory_requirement = FactoryGirl.build :compulsory_requirement, requirement: @requirement 
  end 
  
  subject { @compulsory_requirement }

  it { should be_valid }


  @compulsory_requirement_attributes = [:requirement_id, :requirement_1, :score_1,
     :requirement_2, :score_2, :requirement_3, :score_3, :requirement_4, :score_4, :requirement_5, :score_5,
      :requirement_6, :score_6, :requirement_7, :score_7, :requirement_8, :score_8, :requirement_9, :score_9,
       :requirement_10, :score_10]

  @compulsory_requirement_attributes.each do |attribute|
    it { should respond_to attribute }
  end 

  [:score_1, :score_2, :score_3, :score_4, :score_5, :score_6, 
  	:score_7, :score_8, :score_9, :score_10].each do |attribute|
    it { should validate_presence_of attribute }   
  end    



  it { should belong_to :requirement }
end
