class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  has_many :article_locations
  has_many :articles, through: :article_locations
  has_many :moods, through: :articles
  has_many :categories, through: :articles

  scope :by_mood, -> mood { joins(:moods).where(tags: {name: mood.downcase})}
  scope :by_category, -> category { joins(:categories).where(tags: {name: category.downcase})}
  scope :by_user, -> user_id { joins(:articles).where(articles: {user_id: user_id})}
  scope :by_lat_long, -> lat, long, radius = 1000 { near([lat, long], radius.to_f / 1000, units: :km)}
  scope :by_article, -> article_ids {joins(:articles).where(articles: {id: article_ids})} 
   
  ### DEPRICATED SCOPES
  scope :with_mood, ->(mood) { by_mood(mood)}
  scope :with_category, ->(category) { by_category(category)}
  scope :by_user_id, ->(user_id) {by_user(user_id)}
  
  validates :latitude , numericality: { greater_than:  -90, less_than:  90 }
  validates :longitude, numericality: { greater_than: -180, less_than: 180 }

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
    end rescue nil
  end
end
