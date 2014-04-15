module V1
  class BaseController < ApplicationController
    before_filter :downcase_params
    before_filter :update_depricated_categories_and_moods
    
    
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

    def update_depricated_categories_and_moods
      params[:mood] = old_moods[params[:mood]] || params[:mood]  if params[:mood]
      params[:with_mood] = old_moods[params[:with_mood]] || params[:with_mood]  if params[:with_mood]
      params[:category] = old_categories[params[:category]] || params[:category]  if params[:category]
      params[:with_category] = old_categories[params[:with_category]] || params[:with_category]  if params[:with_category]
    end


    def downcase_params
      params.each do |k, v|
        params[k] = v.downcase if v.is_a? String
        params[k] = v.map {v.try(:downcase) || v} if v.is_a? Array
      end
    end
    
  end
end


