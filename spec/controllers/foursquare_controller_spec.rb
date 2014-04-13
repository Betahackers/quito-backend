require 'spec_helper'

describe FoursquareController do
  describe 'POST list' do
    let(:list_of_venues) {
      Array.new(2) { FactoryGirl.build(:foursquare_hash) }
    }

    context 'metadata' do
      before(:each) do
        allow(Foursquare).to receive(:search_venues).and_return(list_of_venues)
        post :list_venues
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
        post :list_venues, query: search_input
      end

      it 'returns correct json data' do
        expect(response.body).to eq(list_of_venues.to_json)
      end
    end
  end
end
