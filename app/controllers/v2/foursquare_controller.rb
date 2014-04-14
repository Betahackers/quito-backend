module V2
  class FoursquareController < BaseController
    def search
      render json: Foursquare.search_venues(params[:query])
    end
    
    def find
      render json: Foursquare.fetch_venue(params[:id])
    end
  end
end