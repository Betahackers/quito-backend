module V2
  class UsersController < BaseController
    before_action :authorize_json_only
    
    has_scope :by_mood, type: :array
    has_scope :by_category, type: :array
    has_scope :by_lat_long, using: [:lat, :long, :radius], type: :hash
    has_scope :by_article, type: :array
    has_scope :by_location, type: :array
  
    def index
      @users = apply_scopes(@users)
      @users = @users.joins(articles: :locations).eager_load(:articles, articles: :locations) 


      ## Geocoder and will_paginate/kaminari have an issue. tracked here: https://github.com/alexreisner/geocoder/issues/630
      ## Disabled kaminari for now
      # @users = @users.page(params[:page]).per(parms[:per_page])
      ## For now do it as an array
      # params[:offset] ||= 0
      # params[:limit] ||= 200
      # @users = @users.drop(params[:offset].to_i).take(params[:limit].to_i)    
    end
  
    def show
    end
  
    def new
    end
  
    def create
      @user.role = 'member'
      if @user.save
        if user_params[:avatar].present? 
          flash[:notice] = 'Go crop yo-self!'
          render :crop
        else
          flash[:notice] = 'Saved. Thank you!'
          redirect_to users_path
        end
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      # required for settings form to submit when password is left blank
      if params[:user][:password].blank?
         params[:user].delete("password")
         params[:user].delete("password_confirmation")
      end
    
      if @user.update_attributes(user_params)
        if user_params[:avatar].present?
          flash[:notice] = 'Go crop yo-self!'
          render :crop
        else
          flash[:notice] = "Relax, you've been saved..."
          redirect_to articles_path
        end
      else
        render :edit
      end
    end
  
    def destroy
      @user.destroy
      respond_to do |format|
        format.html {redirect_to users_path }
        format.json
      end
    end
  
  
    private

    def authorize_json_only
      if request.format != :json
        authorize! :manage, User, :message => "Unable to view users"
      end
    end
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :about,
                                    :website_url, :twitter_handle, :expert_in, :nationality, :profession,
                                    :avatar, :avatar_cache, :crop_x, :crop_y, :crop_w, :crop_h)
    end
  
  end
end