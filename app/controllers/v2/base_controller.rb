module V2
  class BaseController < ApplicationController
    before_filter :update_depricated_scopes
    before_filter :accept_single_and_array_of_values_in_scope
    
    rescue_from CanCan::AccessDenied do |exception|
      if user_signed_in?
        render 'shared/access_denied'
      else
        redirect_to new_user_session_path
      end
    end
    
    
    def update_depricated_scopes
      params[:by_mood] = params[:mood] if params[:mood]
      params[:by_category] = params[:category] if params[:category]
      params[:by_user] = params[:user] if params[:user]
      params[:by_lat_long] = {lat: params[:li].split(',').first, long: params[:li].split(',').last, radius: params[:radius]} if params[:li]
    end
    
    def accept_single_and_array_of_values_in_scope
      [:by_mood, :by_article, :by_user, :by_category, :by_location].each do |name|
        params[name] = [params[name]] if params[name].is_a? String
      end
    end

  end
end


