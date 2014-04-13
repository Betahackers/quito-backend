module V1
  class LocationsController < ApplicationController
    load_and_authorize_resource

    def index
      if params[:ll]
        @locations = Location.near(params[:ll], params[:radius].to_f / 1000, units: :km)
      else
        @locations = Location.all
      end
      @locations
    end
  end
end
