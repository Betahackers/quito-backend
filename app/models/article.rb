class Article < ActiveRecord::Base
  belongs_to :user

  has_many :locations

  #TODO obtain from moods
  def moods
    ['Illegal','Sociable','Adventure','Active','Cultural','Romantic','Relaxed','Solitary'].sample(rand(3..5))
  end

  def author
    user
  end

  def
end
