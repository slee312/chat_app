class UsersController < ApplicationController
    layout false
    def new
        @user = User.new                
        respond_to do |f|
            f.html { redirect_to home_url }
            f.js
        end
    end
    def create
        @user = User.new(params[:user])
        if @user.save
            session[:username] = params[:user][:username]
        end

        respond_to do |f|
            f.html { redirect_to home_url }
            f.js
        end

    end
end
