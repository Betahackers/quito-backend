require 'spec_helper'

describe Foursquare do
  subject { described_class }

  describe '#client' do
    it 'has correct type' do
      expect(subject.client).to be_a(Foursquare2::Client)
    end
  end

  describe '#fetch_venue' do
    let(:client_mock) { double('Foursquare2::Client') }
    let(:id) { '4fab92ade4b066f573d4bf89' }
    let(:foursquare_hash) { FactoryGirl.build(:foursquare_hash) }

    before(:each) do
      allow(subject).to receive(:client).and_return(client_mock)
      allow(client_mock).to receive(:venue).with(id).and_return(foursquare_hash)
    end

    it 'returns correct hash' do
      expect(subject.fetch_venue(id)).to eq(foursquare_hash)
    end
  end
end
