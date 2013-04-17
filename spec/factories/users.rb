# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) {|n| "person-#{n}@example.com" }
  sequence(:username) {|n| Faker::Name.first_name + "#{n}" }

  factory :user do
    email                             
    password                          "foobar12"
    username
  end
end
