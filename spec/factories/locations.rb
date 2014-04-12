# encoding: utf-8

FactoryGirl.define do
  factory :location do
    factory :betahaus do
      name 'Betahaus'
      foursquare_id 'betahausbcn'
      latitude 41.4069647
      longitude 2.1568569
    end

    factory :gran_ceso do
      name 'Can Tresó'
      foursquare_id '4c49eac320ab1b8d4bb76c17'
      latitude 41.402982
      longitude 2.153739
    end

    factory :montjuic do
      name 'Muntanya de Montjuïc'
      latitude 41.3641667
      longitude 2.1580556
    end
  end
end
