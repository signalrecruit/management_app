require 'rails_helper'

RSpec.describe Score, type: :model do
  before { @score = FactoryGirl.build :score }

  subject { @score }

  it { should be_valid }

  # test instance method
  describe "#score_applicant" do 
  	context "without compulsory requirement" do 
  	  before do 
  	    @applicant_detail = FactoryGirl.create :applicant_detail
  	    @score = FactoryGirl.create :score, applicant_detail: @applicant_detail, qualifications_check: false,
        skills_check: true
  	  end

  	  it "should return 50 for @score.total_score" do 
  	    @score.score_applicant	
  	    expect(@score.total_score).to eq 50 	
  	  end
  	end

  	context "with compulsory requirement with only one requirement filled" do 
  	  before do 
  	  	@applicant_detail = FactoryGirl.create :applicant_detail
  	  	@score = FactoryGirl.create :score, applicant_detail: @applicant_detail, qualifications_check: true,
  	  	skills_check: false, requirement_1_check: true
  	  end

  	  it "should return 66.67 for @score.total_score" do 
  	  	@score.score_applicant
  	  	expect(@score.total_score).to be_within(0.1).of(66.66)
  	  end	
  	end
  end
end
