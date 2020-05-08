class UsersController < ApplicationController
    before_action :require_logged_in, except: [:new, :create]
    
    def index
        
    end
    
    def new
       @user = User.new 
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save  
            session[:user_id] = @user.id
            redirect_to user_path(@user),
            notice: "You have successfully created an account"
        else
            render :new 
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
