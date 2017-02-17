FactoryGirl.define do
  factory :recruiter do
  	email { FFaker::Internet.email }
  	password "password"
  	password_confirmation "password"    
  end
end
