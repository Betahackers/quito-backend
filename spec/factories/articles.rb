# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title 'First article ever'
    content 'Cillum mumblecore pop-up readymade Austin, Bushwick +1 delectus ' \
            'artisan mollit chillwave. Non tote bag dolore, roof party keytar ' \
            'nisi tattooed. Salvia dolore roof party, quis ea yr polaroid synth.'
    user
    mood_list {::Settler.moods.value.keys.sample(rand(2..4))}
    category_list {::Settler.categories.value.keys.sample(rand(2..4))}
    
    factory :article_with_location do
      after(:create) do |article|
        article.locations << FactoryGirl.create(:random_location)
      end
    end
  end
end
