FactoryGirl.define do
  factory :requirement do
    title "MyString"
    job_type "MyString"
    location "MyString"
    experience 1
    min_salary "9.99"
    max_salary "9.99"
    number_of_vacancies 1
    company nil
  end
end
