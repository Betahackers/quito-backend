FactoryGirl.define do
  factory :foursquare_hash, class: Hash do
    initialize_with { attributes.stringify_keys }

    id '4fab92ade4b066f573d4bf89'
    name 'betahaus I Barcelona'
    location({
      'address' => 'Vilafranca, 7',
      'lat' => 41.40682130806744,
      'lng' => 2.1566629085266347,
    })
  end
end
