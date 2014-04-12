class Article < ActiveRecord::Base
  belongs_to :user

  def moods
    ['Illegal','Sociable','Adventure','Active','Cultural','Romantic','Relaxed','Solitary'].sample(rand(3..5))
  end
  def author
    User.first.id
  end
end
