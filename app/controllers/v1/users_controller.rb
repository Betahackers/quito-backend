module V1
  class UsersController < ApplicationController
    load_and_authorize_resource

    before_action :authorize_json_only
  
    def index
      respond_to do |format|
        format.html { authorize! :manage, User, :message => "Unable to view users" }
        format.json
      end
    end
  
    def show
    end
  
    def new
    end
  
    def create    
      respond_to do |format|
        if @user.save
          format.html {redirect_to users_path}
          format.json { render json: @user }
        else
          format.html {render :new}
          format.json
        end
      end
    end
  
    def edit
    end
  
    def update

      respond_to do |format|

        if @user.update_attributes(user_params)
          format.html  {redirect_to users_path}
          format.json { render json: @user }
        else
          format.html {render :edit}
          format.json
        end
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
                                    :website_url, :twitter_handle, :expert_in, :nationality, :profession)
    end
  
  end
end