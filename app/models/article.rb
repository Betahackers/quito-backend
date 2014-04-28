class Article < ActiveRecord::Base
  acts_as_taggable_on :moods, :categories
  acts_as_paranoid
  max_paginates_per 200

  belongs_to :user
  has_many :article_locations
  has_many :locations, through: :article_locations
  accepts_nested_attributes_for :article_locations

  before_save :set_default_kind
  after_update :touch_user_and_location
    
  validates :title, :content, :user_id, :mood_list, :category_list, presence: true
  validates :content, length: {maximum: 270}
  
  
  scope :by_mood, -> mood { tagged_with(mood, on: :moods)}
  scope :by_category, -> category { tagged_with(category, on: :categories)}
  scope :by_user, -> user_ids { user_ids ? where(user_id: user_ids) : where(true)}
  scope :by_lat_long, -> lat, long, radius = 1000 { joins(:locations).where(locations: {id: Location.by_lat_long(lat, long, radius).map(&:id)})}
  scope :by_location, -> location_ids {joins(:locations).where(locations: {id: location_ids})}
  

  
  def author
    user
  end
  
  private
  
  def touch_user_and_location
    user.touch
    locations.each(&:touch)
  end
  
  def set_default_kind
    self.kind ||= 'tidbit'
  end
  
  def self.collection_cache_key
    connection.select_value('select md5(ARRAY_AGG(updated_at)::text) from articles')
  end

end
