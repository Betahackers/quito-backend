require 'spec_helper'

describe Foursquare do
  subject { described_class }

  context 'client' do
    describe '#client' do
      it 'has correct type' do
        expect(subject.client).to be_a(Foursquare2::Client)
      end
    end
  end

  context 'access_methods' do
    let(:client_mock) { double('Foursquare2::Client') }
    before(:each) do
      allow(subject).to receive(:client).and_return(client_mock)
      allow(client_mock).to receive(method_name).with(underlying_input).and_return(result)
    end

    describe '#fetch_venue' do
      let(:method_name) { 'venue' }
      let(:underlying_input) { '4fab92ade4b066f573d4bf89' }
      let(:result) { FactoryGirl.build(:foursquare_hash) }

      it 'returns correct hash' do
        expect(subject.fetch_venue(underlying_input)).to eq(result)
      end
    end

    describe '#search_venues' do
      let(:method_name) { 'search_venues' }
      let(:barcelona_location) { '41.3850639,2.1734035' }
      let(:input) { 'Beta' }
      let(:underlying_input) { { ll: barcelona_location, query: input } }
      let(:result) {
        {
          'venues' => Array.new(2) { FactoryGirl.build(:foursquare_hash) }
        }
      }

      before(:each) do
        allow(subject).to receive(:barcelona).and_return(barcelona_location)
      end

      it 'returns correct search result' do
        expect(subject.search_venues(input)).to eq(result['venues'])
      end
    end
  end
end
