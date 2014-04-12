class Article < ActiveRecord::Base
  belongs_to :user

  has_many :locations
  
  acts_as_taggable_on :moods, :categories
  

  #TODO obtain from moods
  def moods
    ['Illegal','Sociable','Adventure','Active','Cultural','Romantic','Relaxed','Solitary'].sample(rand(3..5))
  end

  def author
    user
  end

end
