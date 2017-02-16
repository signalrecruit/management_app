FactoryGirl.define do
  factory :company do
  	name { FFaker::Company.name}
  	email { FFaker::Internet.email }
  	password "password"
  	password_confirmation "password"
    phonenumber "0204704427"
    auth_code Devise.friendly_token

    trait :contacted do 
      contacted true	
    end
  end
end
