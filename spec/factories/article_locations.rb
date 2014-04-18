# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article_location do
    association :article
    association :random_location
  end
end
