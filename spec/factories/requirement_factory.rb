FactoryGirl.define do
  factory :requirement do
    array_of_title = ["Senior Ruby Architect", "Rails Developer", "Senior Software Engineer", "Web Developer"]


    title { array_of_title[rand(0..3)] }
    location { FFaker::Address.city }
    experience { rand(0..10) }
    min_salary { rand(500..1000).to_f }
    max_salary { rand(1000..5000).to_f }
    number_of_vacancies { rand(0..100) }
    qualification_ids [1, 2]
    skill_ids [1, 2] 
    job_type_ids [1]
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

    factory :requirement_with_job_types do 
      transient do 
        job_types_count 5
      end

      after(:create) do |requirement, evaluator|
        create_list(:job_type, evaluator.job_types_count, requirements: [requirement])
      end

    factory :requirement_with_applicant_details do 
      transient do 
        applicant_details_count 5
      end

      after(:create) do |requirement, evaluator|
        create_list(:applicant_detail, evaluator.applicant_details_count, requirement: requirement)
      end
    end
    end
  end

  factory :job_type do 
    job_types = ["Research", "Software Development", "Software Architecture", "Secretary"]
    name { job_types[rand(0..3)] }


    factory :job_type_with_requirements do 
      transient do 
        requirements_count 5
      end

      after(:create) do |job_type, evaluator|
        create_list(:requirement, evaluator.requirements_count, job_types: [job_type])
      end
    end

    factory :job_type_with_applicant_details do 
      transient do 
        applicant_details_count 5
      end  

      after(:create) do |job_type, evaluator|
        create_list(:applicant_detail, evaluator.applicant_details_count, job_types: [job_type])
      end
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


  factory :applicant_detail do
    array_of_job_title = ["Senior Ruby Architect", "Rails Developer", "Senior Software Engineer", "Web Developer"]
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    phonenumber "00000000"
    job_title { array_of_job_title[rand(0..3)] }
    location { FFaker::Address.city  }
    experience { rand(0..60) }
    min_salary { rand(500..1000).to_f }
    max_salary { rand(1000..5000).to_f }
    qualification_ids [1, 2]
    skill_ids [1, 2] 
  


    factory :applicant_detail_with_experiences do 
      transient do 
        experiences_count 5
      end

      after(:create) do |applicant_detail, evaluator|
        create_list(:experience, evaluator.experiences_count, applicant_detail: applicant_detail)
      end
    end 

    factory :applicant_detail_with_skills do 
      transient do 
        skills_count 5
      end

      after(:create) do |applicant_detail, evaluator|
        create_list(:skill, evaluator.skills_count, applicant_details: [applicant_detail] )
      end
    end

    factory :applicant_detail_with_qualifications do 
      transient do 
        qualifications_count 5
      end

      after(:create) do |applicant_detail, evaluator|
        create_list(:qualification, evaluator.qualifications_count, applicant_details: [applicant_detail])
      end
    end

    factory :applicant_detail_with_job_types do 
      transient do 
        job_types_count 2
      end

      after(:create) do |applicant_detail, evaluator|
        create_list(:job_type, evaluator.job_types_count, applicant_details: [applicant_detail])
      end
    end
  end

  factory :score do 
    skills_check false
    qualifications_check false
    skills_note { FFaker::Lorem.sentence }
    qualifications_note { FFaker::Lorem.sentence }
    skills_score 0
    qualifications_score 0
    requirement_1_check nil
    requirement_2_check nil
    requirement_3_check nil
    requirement_4_check nil
    requirement_5_check nil
    requirement_6_check nil
    requirement_7_check nil
    requirement_8_check nil
    requirement_9_check nil
    requirement_10_check nil
    requirement_1_score nil
    requirement_2_score nil
    requirement_3_score nil
    requirement_4_score nil
    requirement_5_score nil
    requirement_6_score nil
    requirement_7_score nil
    requirement_8_score nil
    requirement_9_score nil
    requirement_10_score nil
    requirement_total_score nil
    total_score 0

    applicant_detail
  end
end
