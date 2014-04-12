class Article < ActiveRecord::Base
  belongs_to :user

  has_many :locations

  #TODO obtain from moods
  def mood_list
    ['Illegal', 'Sociable', 'Adventure', 'Active', 'Cultural', 'Romantic', 'Relaxed', 'Solitary'].sample(rand(3..5))
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
