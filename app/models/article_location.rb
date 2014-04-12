class ArticleLocation < ActiveRecord::Base

  belongs_to :article
  belongs_to :location
end
