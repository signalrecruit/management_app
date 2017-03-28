FactoryGirl.define do
  factory :employee_history do
    organization "MyString"
    position "MyString"
    from "2017-03-28 22:44:33"
    to "2017-03-28 22:44:33"
    reason_for_leaving "MyText"
    employee nil
  end
end
