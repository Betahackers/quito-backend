class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  has_many :article_locations
  has_many :articles, through: :article_locations
  has_many :moods, through: :articles
  has_many :categories, through: :articles

  scope :with_mood, ->(mood) { joins(:moods).where(tags: {name: mood.downcase})}
  scope :with_category, ->(category) { joins(:category).where(tags: {name: category.downcase})}

  def foursquare_fields
    @foursquare_fields ||= Foursquare.fetch_venue(self.foursquare_id)
  end

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
