require 'spec_helper'

describe ArticleLocation do
  pending "add some examples to (or delete) #{__FILE__}"
  
  
  context '#valid' do
    describe '#location' do
      let(:article_location) { FactoryGirl.create(:article_location, location: nil) }

      it 'adds existing location by fsq id' do
        location = FactoryGirl.create(:betahaus)
        article_location.foursquare_id = location.foursquare_id
        article_location.save
        article_location.reload
        expect(article_location.location).to eq location
      end
      
      it 'adds new location by fsq id' do
        article_location.foursquare_id = '4fab92ade4b066f573d4bf89'
        article_location.save
        article_location.reload
        expect(article_location.location.name).to eq 'betahaus I Barcelona'
      end
      

    end
  end

end
