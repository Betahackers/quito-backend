module V1
  class ConfigurationController < ApplicationController
    
  
    def show
      @categories = Settler.categories.value.split(',').map(&:strip)
      @moods = Settler.moods.value.split(',').map(&:strip)
    end
    
    def update
    end
    
  end
end

