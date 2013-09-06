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
            flash.now[:success] = "Signed up"
        else
            flash.now[:alert] = "Failed to sign up"
        end

        respond_to do |f|
            f.html { redirect_to home_url }
            f.js
        end

    end
end
