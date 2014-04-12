require 'spec_helper'

describe Location do
  describe '.new_by_foursquare_hash' do
    before(:each) do
      described_class.new_by_foursquare_hash(foursquare_hash)
    end

    context '#valid' do
      let(:foursquare_hash) { FactoryGirl.build(:foursquare_hash) }
      let(:loaded_object) { Location.find_by_foursquare_id(foursquare_hash['id']) }

      it 'is found by foursquare_id' do
        expect(loaded_object).not_to be_nil
      end

      it 'has all fields filled' do
        expect(loaded_object.id).not_to be_nil
        expect(loaded_object.name).not_to be_nil
        expect(loaded_object.latitude).not_to be_nil
        expect(loaded_object.longitude).not_to be_nil
        expect(loaded_object).to be_geocoded
      end
    end
  end
end
