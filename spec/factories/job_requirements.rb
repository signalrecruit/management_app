FactoryGirl.define do
  factory :job_requirement do
    title "MyString"
    location "MyString"
    job_type "MyString"
    experience 1
    min_salary "9.99"
    max_salary "9.99"
    number_of_vacancies 1
    company nil
  end
end
