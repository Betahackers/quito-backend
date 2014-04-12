class Article < ActiveRecord::Base
  belongs_to :user

  has_many :locations
  
  acts_as_taggable_on :moods, :categories
  
  MOODS = ['Illegal', 'Sociable', 'Adventure', 'Active', 'Cultural', 'Romantic', 'Relaxed', 'Solitary']
  CATEGORIES = []

  #TODO obtain from moods
  def mood_list
    .sample(rand(3..5))
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
