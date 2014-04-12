# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title 'First article ever'
    content 'Cillum mumblecore pop-up readymade Austin, Bushwick +1 delectus ' \
            'artisan mollit chillwave. Non tote bag dolore, roof party keytar ' \
            'nisi tattooed. Salvia dolore roof party, quis ea yr polaroid synth.'
  end
end
