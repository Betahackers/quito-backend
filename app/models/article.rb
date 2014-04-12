class Article < ActiveRecord::Base
  belongs_to :user

  has_many :article_locations
  has_many :locations, through: :article_locations

  #TODO obtain from moods
  def mood_list
    ['Illegal', 'Sociable', 'Adventure', 'Active', 'Cultural', 'Romantic', 'Relaxed', 'Solitary'].sample(rand(3..5))
  end

  def category_list
    ['Eat','Drink','Healthy Life','Culture','Shopping','Dancing','Live Music','Walks'].sample(rand(1..3))
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
