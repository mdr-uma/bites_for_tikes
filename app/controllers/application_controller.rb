class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def require_logged_in
        return redirect_to signin_path unless logged_in?
    end
end
