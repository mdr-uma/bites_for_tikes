class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if auth = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                redirect_to signin_path,
                alert: "Invalid email or password. Please try again."
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end