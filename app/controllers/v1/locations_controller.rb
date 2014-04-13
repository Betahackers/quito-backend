module V1
  class LocationsController < ApplicationController
    load_and_authorize_resource

    def index
      
      @locations = Location.all
      @locations = @locations.near(params[:ll], params[:radius].to_f / 1000, units: :km) if params[:ll]
      @locations = @locations.with_mood(params[:mood]) if params[:mood]
      @locations = @locations.with_category(params[:category]) if params[:category]
      @locations = @locations.by_user_id(params[:user_id]) if params[:user_id]
      @locations = @locations.includes(:articles) if params[:include_articles]
    end
  end
end
