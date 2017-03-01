require 'rails_helper'

RSpec.describe Requirement, type: :model do
  before do
  	q1 = FactoryGirl.create :qualification
  	q2 = FactoryGirl.create :qualification
  	s1 = FactoryGirl.create :skill
  	s2 = FactoryGirl.create :skill
    j1 = FactoryGirl.create :job_type
    @requirement = FactoryGirl.build :requirement, :job_type_ids => [j1.id], :qualification_ids => [q1.id, q2.id], :skill_ids => [s1.id, s2.id] 
  end

  subject { @requirement }

  it { should be_valid }

  @requirement_attributes = [:title, :location, :experience, :min_salary, :max_salary,
  		:number_of_vacancies, :note, :company_id, :job_types, :qualifications, :skills]

  # model should respond to attributes
  @requirement_attributes.each do |attribute|
    it { should respond_to attribute }
  end

  # test presence of attributes
  [:title, :location, :experience, :min_salary, :max_salary,
  		:number_of_vacancies, :company_id]
.each do |attribute|
    it { should validate_presence_of attribute }
  end

  # test HABTM associations
  it { should have_and_belong_to_many :qualifications }
  it { should have_and_belong_to_many :skills }
  it { should have_and_belong_to_many :job_types }

  # test has_one and belongs_to association
  it { should have_one :compulsory_requirement }
  it { should belong_to :company }

  # test instance methods
  describe "test instance methods" do
    before { @requirement.save }

    context "#send_requirements" do 

      it "should update sent attribute" do 
      	@requirement.send_requirements
      	expect(@requirement.sent).not_to eq nil
      end
    end

    context "#requirements_sent?" do 
      
      it "should return false if sent is nil" do 
        @requirement.sent = nil 
        expect(@requirement.requirements_sent?).to eq false  	
      end

      it "should return true if sent is equal to Time.now" do 
      	@requirement.send_requirements
      	expect(@requirement.requirements_sent?).to eq true
      end
    end
  end

  # test class methods
  describe "test class methods" do 
    before do 
      q1 = FactoryGirl.create :qualification
  	  q2 = FactoryGirl.create :qualification
  	  s1 = FactoryGirl.create :skill
  	  s2 = FactoryGirl.create :skill	
      @requirement1 = FactoryGirl.create :requirement, :qualification_ids => [q1.id, q2.id], :skill_ids => [s1.id, s2.id] 
      @requirement2 = FactoryGirl.create :requirement, :qualification_ids => [q1.id, q2.id], :skill_ids => [s1.id, s2.id] 
      @requirement3 = FactoryGirl.create :requirement, :qualification_ids => [q1.id, q2.id], :skill_ids => [s1.id, s2.id]  
      @requirement1.send_requirements
      @requirement3.send_requirements
    end

    it "#only_sent_requirements should return @requirement1 and @requirement3" do 
      expect(Requirement.only_sent_requirements).to match_array([@requirement1, @requirement3])
    end
  end

  # test dependent destroy
  describe "test dependent destroy" do
    before { @requirement.save }

    context "with compulsory_requirement" do 
      before { FactoryGirl.create :compulsory_requirement, requirement: @requirement }
      
      it "raises error for dependent destroy" do
      	compulsory_requirement = @requirement.compulsory_requirement

      	expect{ @requirement.destroy }.to change(CompulsoryRequirement, :count).by(-1)

      	# expect(CompulsoryRequirement.find(compulsory_requirement.id)).to raise_error ActiveRecord::RecordNotFound
     end
   end	
 end
end
