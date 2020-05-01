class UsersController < ApplicationController
    def new
       @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save && @user.authenticate(password: params[:password])
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
