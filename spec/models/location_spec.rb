require 'spec_helper'

describe Location do
  describe '.by_foursquare_id' do
    context 'existing location' do
      let(:location) { FactoryGirl.create(:betahaus) }

      it 'doesn\'t call out to foursquare' do
        expect(Foursquare).not_to receive(:fetch_venue)
        described_class.by_foursquare_id(location.foursquare_id)
      end

      it 'doesn\'t create additional locations' do
        foursquare_id = location.foursquare_id
        expect{
          described_class.by_foursquare_id(foursquare_id)
        }.not_to change{Location.count}
      end
    end

    context 'non-existing location' do
      let(:foursquare_hash) { FactoryGirl.build(:foursquare_hash) }
      let(:loaded_object) { described_class.by_foursquare_id(foursquare_hash['id']) }

      before(:each) do
        allow(Foursquare).to receive(:fetch_venue).and_return(foursquare_hash)
      end

      it 'creates new object' do
        expect {
          expect(loaded_object.id).not_to be_nil
          expect(loaded_object.foursquare_id).not_to be_nil
          expect(loaded_object.name).not_to be_nil
          expect(loaded_object.longitude).not_to be_nil
          expect(loaded_object.latitude).not_to be_nil
        }.to change{Location.count}.by(1)
      end
    end
  end
end
