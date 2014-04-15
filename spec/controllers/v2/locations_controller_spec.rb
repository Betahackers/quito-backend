require 'spec_helper'

describe V2::LocationsController do
  before(:each) do
    allow(Foursquare)
      .to receive(:fetch_venue)
      .and_return(FactoryGirl.build(:foursquare_hash))
  end

  describe '#index' do
    context 'metadata' do
      it 'returns json' do
        get :index, format: :json
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'data' do
      context 'with filter' do
        let(:ll) { '41.3850296,2.1733773' }
        let(:lat) { '41.3850296' }
        let(:long) {'2.1733773'}
        let(:radius) { '800' }
        let(:search_result) {
          [:betahaus, :montjuic, :tibidabo].map{|factory|
            FactoryGirl.build(factory)
          }
        }
        let(:expected_ids) { search_result.map{|l| l.foursquare_id}.sort }

        before(:each) do
          allow(Location)
            .to receive(:by_lat_long)
            .with(lat, long, radius)
            .and_return(search_result)
        end
        
        it 'returns correct data' do
          get :index, format: :json, ll: ll, radius: radius
          returned_ids = JSON.parse(response.body)['locations']
                            .map{|r| r['location']['foursquare_id']}
                            .sort
          expect(returned_ids).to eq(expected_ids)
        end
      end
    end
    
    
    
    
    
    context 'data' do
      context 'with long_lat filter' do
        let(:lat) { '41.3850296' }
        let(:long) {'2.1733773'}
        let(:radius) { '800' }
        let(:search_result) {
          [:betahaus, :montjuic, :tibidabo].map{|factory|
            FactoryGirl.build(factory)
          }
        }
        let(:expected_ids) { search_result.map{|l| l.foursquare_id}.sort }

        before(:each) do
          allow(Location)
            .to receive(:by_lat_long)
            .with(lat, long, radius)
            .and_return(search_result)
        end

        it 'returns correct data' do
          get :index, format: :json, by_lat_long: {lat: lat, long: long, radius: radius}
          returned_ids = JSON.parse(response.body)['locations']
                            .map{|r| r['location']['foursquare_id']}
                            .sort
          puts JSON.parse(response.body)
          expect(returned_ids).to eq(expected_ids)
        end
      end
    end
    
    
    
    
  end

  describe '#show' do
    let(:location) { FactoryGirl.create(:betahaus) }

    context 'id' do
      it 'finds location with existing ID' do
        get :show, format: :json, id: location.id
        expect(response).to be_ok
      end
    end

    context 'foursquare id' do
      it 'finds location with existing foursquare ID' do
        get :show, format: :json, id: location.foursquare_id
        expect(response).to be_ok
      end
    end

    context 'non-existing id' do
      it 'doesn\'t find non-existing ID' do
        expect {
          get :show, format: :json, id: "NOT_#{location.id}"
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
