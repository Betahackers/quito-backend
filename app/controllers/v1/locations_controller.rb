module V1
  class LocationsController < ApplicationController
    load_and_authorize_resource

    def index
      Location.all
    end
  end
end
