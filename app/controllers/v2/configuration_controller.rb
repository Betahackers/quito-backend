module V2
  class ConfigurationController < BaseController
  
    def show
      authorize! :read, :configuration
      @categories = Settler.categories.value
      @moods = Settler.moods.value
    end
    
    def update
      authorize! :update, :configuration
      #write code to update configuration
    end
    
  end
end

