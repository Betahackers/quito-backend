require 'spec_helper'

describe V1::LocationsController do
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
        let(:radius) { '800' }
        let(:search_result) {
          [:betahaus, :montjuic, :tibidabo].map{|factory|
            FactoryGirl.build(factory)
          }
        }
        let(:expected_ids) { search_result.map{|l| l.foursquare_id}.sort }

        before(:each) do
          allow(Location)
            .to receive(:near)
            .with(ll, radius.to_f / 1000, units: :km)
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
  end
end
