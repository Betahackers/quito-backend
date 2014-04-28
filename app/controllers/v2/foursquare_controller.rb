module V2
  class FoursquareController < BaseController
    skip_load_resource 
    def search
      venues = Foursquare.search_venues(params[:query])
      SearchMiss.create(query: params[:query]) if venues.empty?
      render json: venues
    end
    
    def find
      render json: Foursquare.fetch_venue(params[:id])
    end
  end
end