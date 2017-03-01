require 'rails_helper'

RSpec.describe ApplicantDetail, type: :model do
  before do
  	q1 = FactoryGirl.create :qualification
  	q2 = FactoryGirl.create :qualification
  	s1 = FactoryGirl.create :skill
  	s2 = FactoryGirl.create :skill
  	j1 = FactoryGirl.create :job_type
    @applicant_detail = FactoryGirl.build :applicant_detail, :job_type_ids => [j1.id], :qualification_ids => [q1.id, q2.id], :skill_ids => [s1.id, s2.id] 
  end

  subject { @applicant_detail }

  it { should be_valid }

  # test associations
  it { should belong_to :requirement }
  it { should have_many :experiences }
  it { should have_one :score }
  it { should have_and_belong_to_many :skills }
  it { should have_and_belong_to_many :qualifications }
  it { should have_and_belong_to_many :job_types }

  # test dependent destroy

  describe "#test dependent destroy" do 
    before { @applicant_detail.save }

    context "with score" do
      before  { FactoryGirl.create :score, applicant_detail: @applicant_detail }
      
      it "should decrease score by one" do 
      	score = @applicant_detail.score

      	expect{ @applicant_detail.destroy }.to change(Score, :count).by(-1)
      end 	
    end

    context "with experiences" do 
    end
  end

  [:name, :email, :phonenumber, :location, :experience, :min_salary,
  :max_salary, :job_title].each do |attribute|
    it { should validate_presence_of attribute }
  end
  

end
