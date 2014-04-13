require 'spec_helper'

describe V1::LocationsController do
  describe '#index' do
    it 'returns json' do
      get :index, format: :json
      expect(response.content_tyoe).to eq('application/json')
    end
  end
end
