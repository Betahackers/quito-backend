class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  has_many :article_locations
  has_many :articles, through: :article_locations

end
