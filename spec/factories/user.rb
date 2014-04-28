# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "first#{n}"}
    sequence(:last_name) {|n| "last#{n}"}
    sequence(:email) {|n| "testuser#{n}@email.com"}
    role 'member'
    about 'Im very interesting'
    profession 'goofball'
    nationality 'spanglish'
    expert_in 'being an expert'
    password 'secret1234'
  end
end
