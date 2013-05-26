# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    start_time "2013-05-25 18:02:21"
    agreed false
  end
end
