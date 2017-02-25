FactoryGirl.define do
  factory :score do
    skills_check false
    qualifications_check false
    skills_note "MyString"
    qualifications_note "MyString"
    skills_score 1
    qualifications_score 1
  end
end
