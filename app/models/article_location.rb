class ArticleLocation < ActiveRecord::Base

  belongs_to :article
  belongs_to :location
  attr_accessor :foursquare_id
  
  def foursquare_id=(value)
    self.location = Location.by_foursquare_id value
  end
  
  def foursquare_id
    location.try(:foursquare_id)
  end
  
  def name
    location.try(:name)
  end
  
end
