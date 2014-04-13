module V1
  class LocationsController < ApplicationController
    load_and_authorize_resource

    def index
      
      @locations = Location.all
      @locations = @locations.near(params[:ll], params[:radius].to_f / 1000, units: :km) if params[:ll]
      @locations = @locations.with_mood(params[:mood]) if params[:mood]
      @locations = @locations.with_category(params[:category]) if params[:category]
    end
  end
end
