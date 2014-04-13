module V1
  class FoursquareController < ApplicationController
    def search
      render json: Foursquare.search_venues(params[:query])
    end
    
    def find
      render json: Foursquare.fetch_venue(params[:id])
    end
  end
end