module V1
  class FoursquareController < ApplicationController
    def list_venues
      render json: Foursquare.search_venues(params[:query])
    end
  end
end