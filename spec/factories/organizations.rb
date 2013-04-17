# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    name "MyString"
    url "MyString"
    url_type "MyString"
    latitude 1.5
    longitude 1.5
  end
end
