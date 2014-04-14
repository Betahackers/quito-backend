module V2
  class BaseController < ApplicationController
    
    rescue_from CanCan::AccessDenied do |exception|
      if user_signed_in?
        render 'shared/access_denied'
      else
        redirect_to new_user_session_path
      end
    end
    

  end
end


