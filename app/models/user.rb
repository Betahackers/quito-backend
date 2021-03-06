class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  acts_as_paranoid
  max_paginates_per 200
  ROLES = ['member', 'admin']
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :avatar, AvatarUploader
  
  has_many :articles
  has_many :locations, through: :articles
  has_many :moods, through: :articles
  has_many :categories, through: :articles
  
  after_update :touch_articles_and_locatinos
  after_update :crop_avatar

  validates :first_name, :last_name, :role, :about, :profession, :nationality, :expert_in, presence: true
  validates :website_url, format: URI::regexp(%w(http https)), allow_blank: true
  validates :twitter_handle, format: /\A([a-zA-Z](_?[a-zA-Z0-9]+)*_?|_([a-zA-Z0-9]+_?)*)\z/, allow_blank: true
  validates :role, inclusion: {in: User::ROLES, message: "Role should be one of #{ROLES.join(", ")}"}
  validates :about, length: {maximum: 270}  
  
  scope :by_mood, -> mood { joins(:moods).where(tags: {name: mood})}
  scope :by_category, -> category { joins(:categories).where(tags: {name: category})}
  scope :by_lat_long, -> lat, long, radius = 1000 { joins(:locations).where(locations: {id: Location.by_lat_long(lat, long, radius).map(&:id)})}
  scope :by_article, -> article_ids {joins(:articles).where(articles: {id: article_ids})} 
  scope :by_location, -> location_ids {joins(:locations).where(locations: {id: location_ids})}
  
  def admin?
    role == 'admin'
  end

  def member?
    role == 'member'
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
  
  def avatar_versions
   avatar.versions.keys
  end
  
  def avatar_url_prefix
   avatar.url.split("/")[0..-2].join("/") + '/'
  end
  
  def avatar_url_suffix
    avatar.url.split("/").last
  end
  
  
  def self.collection_cache_key
    connection.select_value('select md5(ARRAY_AGG(updated_at)::text) from users')
  end
  
  private
  
  def touch_articles_and_locatinos
    articles.each(&:touch)
    locations.each(&:touch)
  end
  
  
end
