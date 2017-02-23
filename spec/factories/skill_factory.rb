FactoryGirl.define do
  factory :skill do
  	skills = ["programming", "accounting", "visual art"]
    name { skills[rand(0..2)] }
    score 1
  end
end
