class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  def self.by_foursquare_id foursquare_id
    find_or_create_by!(foursquare_id: foursquare_id) do |l|
      hash = Foursquare.fetch_venue(foursquare_id)
      l.foursquare_id = hash['id']
      l.name = hash['name']
      l.latitude = hash['location']['lat']
      l.longitude = hash['location']['lng']
    end
  end
end
