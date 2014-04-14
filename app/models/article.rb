class Article < ActiveRecord::Base
  belongs_to :user

  has_many :article_locations
  has_many :locations, through: :article_locations

  accepts_nested_attributes_for :article_locations

  acts_as_taggable_on :moods, :categories
  acts_as_paranoid

  MOODS = ['Illegal', 'Sociable', 'Adventure', 'Active', 'Cultural', 'Romantic', 'Relaxed', 'Solitary']
  CATEGORIES = ['Eat', 'Drink', 'Healthy Life', 'Culture', 'Shopping', 'Dancing', 'Live Music', 'Walks']


  scope :by_mood, -> mood { tagged_with(mood, on: :moods)}
  scope :by_category, -> category { tagged_with(category, on: :categories)}
  scope :by_user, -> user_ids { where(user_id: user_ids)}
  scope :by_lat_long, -> lat, long, radius = 1000 { joins(:locations).where(locations: {id: Location.by_lat_long(lat, long, radius).map(&:id)})}
  # scope :by_location, -> location_ids {joins(:locations).where(locations {id: location_ids})}
  
  # FIXME: doesn't work like this. Need to write a custom validator that validates an array against an array
  # validates :mood_list, inclusion: {in: MOODS}
  # validates :categories, inclusion: {in: CATEGORIES}

  def location
    #this is fake, just to use the form field
  end

  def author
    user
  end

  def article_type
    if locations.length > 1
      "itinerary"
    else
      "review"
    end
  end

end
