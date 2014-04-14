module V2
  class BaseController < ApplicationController

    ## ORDER IS IMPORTANT HERE
    before_filter :downcase_params
    before_filter :update_depricated_scopes
    before_filter :make_strings_into_arrays
        
    rescue_from CanCan::AccessDenied do |exception|
      if user_signed_in?
        render 'shared/access_denied'
      else
        redirect_to new_user_session_path
      end
    end
    
    
    def old_moods
      {
        'illegal' => 'lawbreaker',
        'sociable' => 'social',
        'adventure' => 'adventurous',
        'active' => 'energetic',
        'cultural' => 'intellectual',
        'romantic' => 'romantic',
        'relaxed' => 'relaxed',
        'solitary' => 'lonely'
        }        
    end
    
    def old_categories
      {
        'eat' => 'food',
        'healthy life' => 'healthy_life',
        'drink' => 'drinks',
        'culture' => 'culture',
        'shopping' => 'shopping',
        'dancing' => 'alternative',
        'live music' => 'music',
        'walks' => 'have_a_stroll'
        }        
    end
    
    def downcase_params
      params.each do |k, v|
        params[k] = v.downcase if v.is_a? String
        params[k] = v.map {v.try(:downcase) || v} if v.is_a? Array
      end
    end
    
    def make_strings_into_arrays
      [:by_mood, :by_article, :by_user, :by_category, :by_location].each do |name|
        params[name] = [params[name]] if params[name].is_a? String
      end
    end
    
    def update_depricated_scopes
      params[:by_mood] = old_moods[params[:mood]] || params[:mood]  if params[:mood]
      params[:by_mood] = old_moods[params[:with_mood]] || params[:with_mood]  if params[:with_mood]
      params[:by_category] = old_categories[params[:category]] || params[:category]  if params[:category]
      params[:by_category] = old_categories[params[:with_category]] || params[:with_category]  if params[:with_category]
      params[:by_user] = params[:user_id] if params[:user_id]
      params[:by_lat_long] = {lat: params[:li].split(',').first, long: params[:li].split(',').last, radius: params[:radius]} if params[:li]
    end
    
  end
end


