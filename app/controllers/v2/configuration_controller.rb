module V2
  class ConfigurationController < BaseController
   skip_load_resource 
    def show
      @categories = Settler.categories.value
      @moods = Settler.moods.value
    end
    
    def update
    end
    
  end
end

