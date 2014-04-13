require 'spec_helper'

describe V1::FoursquareController do
  describe 'GET search' do
    let(:list_of_venues) {
      Array.new(2) { FactoryGirl.build(:foursquare_hash) }
    }

    context 'metadata' do
      before(:each) do
        allow(Foursquare).to receive(:search_venues).and_return(list_of_venues)
        get :search
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'returns json' do
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'data' do
      let(:search_input) { 'Beta' }

      before(:each) do
        allow(Foursquare)
          .to receive(:search_venues)
          .with('Beta')
          .and_return(list_of_venues)
        get :search, query: search_input
      end

      it 'returns correct json data' do
        expect(response.body).to eq(list_of_venues.to_json)
      end
    end
  end
end
