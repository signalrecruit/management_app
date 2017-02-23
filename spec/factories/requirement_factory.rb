FactoryGirl.define do
  factory :requirement do
    array_of_title = ["Senior Ruby Architect", "Rails Developer", "Senior Software Engineer", "Web Developer"]
    job_type_array = ["web development", "software engineering"]


    title { array_of_title[rand(0..3)] }
    job_type { job_type_array[rand(0..1)] }
    location { FFaker::Address.city }
    experience { rand(0..10) }
    min_salary { rand(500..1000).to_f }
    max_salary { rand(1000..5000).to_f }
    number_of_vacancies { rand(0..100) }
    qualification_ids [1, 2]
    skill_ids [1, 2] 
    company 

    trait :qualification_ids do 
      qualification_ids [1, 2]
    end

    trait :skill_ids do 
      skill_ids [1, 2]      
    end
  end

  factory :requirement_with_qualifications do
    transient do 
      qualifications_count 2    
    end

    after(:create) do |requirement, evaluator|
      create_list(:qualification, evaluator.qualifications_count, requirements: [requirement])    
    end
  end

  factory :qualification do
    qualifications = ["BSc", "MSc", "MPhil", "PhD", "diploma" ]
    name { qualifications[rand(0..4)] }
    score 1
    
    factory :qualification_with_requirements do 
      transient do 
        requirements_count 5
      end

      after(:create) do |qualification, evaluator|
        create_list(:requirement, evaluator.requirements_count, qualifications: [qualification])
      end
    end
  end
end
