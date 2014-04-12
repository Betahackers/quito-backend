class Article < ActiveRecord::Base
  belongs_to :user

  has_many :locations
  
  acts_as_taggable_on :moods, :categories
  
  MOODS = ['Illegal', 'Sociable', 'Adventure', 'Active', 'Cultural', 'Romantic', 'Relaxed', 'Solitary']
  CATEGORIES = ['Eat', 'Drink', 'Healthy Life', 'Culture', 'Shopping', 'Dancing', 'Live Music', 'Walks']

  #TODO obtain from moods

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
