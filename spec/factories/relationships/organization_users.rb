# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :relationships_organization_user, :class => 'Relationships::OrganizationUser' do
    organization_id 1
    user_id 1
  end
end
