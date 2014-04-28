module V2
  class BaseController < ApplicationController
    load_and_authorize_resource
    before_filter :make_strings_into_arrays
    before_filter :set_cache_key_from_params
    before_filter :update_request_count, only: :show
    
    rescue_from CanCan::AccessDenied do |exception|
      if user_signed_in?
        render 'shared/access_denied'
      else
        redirect_to new_user_session_path
      end
    end
    
    private 
    
    def make_strings_into_arrays
      [:by_mood, :by_article, :by_user, :by_category, :by_location].each do |name|
        params[name] = [params[name]] if params[name].is_a? String
      end
    end
    
    def set_cache_key_from_params
      #these are the only params used to determine the content of the json partial FOR A SINGLE OBJECT
      @cache_key = params.slice(:by_user, :controller, :include_foursquare).hash
    end
    
    def update_request_count
      resource = instance_variable_get("@#{controller_name.singularize}")
      resource.update_column(:request_count, resource.request_count.to_i + 1)
    end
    
  end
end


