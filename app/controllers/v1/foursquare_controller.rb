module V1
  class FoursquareController < ApplicationController
    def search
      render json: Foursquare.search_venues(params[:query])
    end
  end
end