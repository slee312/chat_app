class ApplicationController < ActionController::Base
    helper_method :current_user

    protect_from_forgery

    def current_user
        @current_user ||= User.find_by(username: session[:username]) if session[:username]
    end
end
