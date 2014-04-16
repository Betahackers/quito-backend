module V2
  class BaseController < ApplicationController
    before_filter :make_strings_into_arrays
    before_filter :set_cach_key_from_params
    
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
    
    def set_cach_key_from_params
      @cach_key = params.slice(:by_mood, :by_article, :by_user, :by_category, :by_location, :controller).hash
    end

  end
end


