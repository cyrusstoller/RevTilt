# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cache_review_stat, :class => 'Cache::ReviewStat' do
    organization_id 1
    num_reviews 1
    avg_review 1.5
    condition_id 1
  end
end
