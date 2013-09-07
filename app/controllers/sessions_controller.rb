class SessionsController < ApplicationController
    def new
        respond_to do |f|
           f.html { redirect_to home_url }
           f.js
        end
    end

    def create
        user = User.authenticate(params[:username], params[:password])        
        if user
            session[:username] = params[:username]
            @status = 1
        else
            @status = 0 
        end

        render text: "hey"
    end

    def destroy
        session.clear
        redirect_to home_url
    end
end
