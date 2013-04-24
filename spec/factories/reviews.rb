# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    rating 1
    content "MyText"
    user_id 1
    condition_id 1
    organization_id 1
  end
end
