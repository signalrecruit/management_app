FactoryGirl.define do
  factory :request do
    position = ["CEO", "HR", "Head of Department", "Managing Director", "Manager", "Director"]
    fullname { FFaker::Name.name }
    email { FFaker::Internet.email }
    phonenumber "0204704427"
    company { FFaker::Company.name }
    job_title { position[rand(0..5)] }
  end
end
