module V1
  class ConfigurationController < ApplicationController
    
  
    def show
      authorize! :read, :configuration
      @categories = Settler.categories.value.split(',').map(&:strip)
      @moods = Settler.moods.value.split(',').map(&:strip)
    end
    
    def update
      authorize! :update, :configuration
      #write code to update configuration
    end
    
  end
end

