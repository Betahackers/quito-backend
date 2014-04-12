class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  def self.new_by_foursquare_hash hash
    create!(
      foursquare_id: hash['id'],
      name: hash['name'],
      latitude: hash['location']['lat'],
      longitude: hash['location']['lng'],
    )
  end
end
