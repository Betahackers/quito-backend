class Article < ActiveRecord::Base
  belongs_to :user

  has_many :article_locations
  has_many :locations, through: :article_locations
  
  acts_as_taggable_on :moods, :categories
  
  MOODS = ['Illegal', 'Sociable', 'Adventure', 'Active', 'Cultural', 'Romantic', 'Relaxed', 'Solitary']
  CATEGORIES = ['Eat', 'Drink', 'Healthy Life', 'Culture', 'Shopping', 'Dancing', 'Live Music', 'Walks']

  # FIXME: doesn't work like this. Need to write a custom validator that validates an array against an array
  # validates :mood_list, inclusion: {in: MOODS}
  # validates :categories, inclusion: {in: CATEGORIES}
  
  def location
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
