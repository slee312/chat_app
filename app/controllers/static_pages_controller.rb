class StaticPagesController < ApplicationController
  def home
    #temp to test features prior to verification
    cookies.delete :in_boston
    
    if cookies.signed[:in_boston]
      headers["Status"] = "301 Moved Permanently"
      redirect_to(home_url)
    else
        #redirect because geolocation doesn't work right now.        
    end
  end
  
  def verify_status
    lat = params[:verify_lat]
    long = params[:verify_long]

    #geocode latitude and longitude using Open MQ Geocoding API
    app_key = "Fmjtd%7Cluub25ub2g%2C2n%3Do5-9u851f" 
    response = HTTParty.get("http://open.mapquestapi.com/geocoding/v1/reverse?key=" + app_key + "&outFormat=json&location=#{lat},#{long}")
    #parse response and determine if user is in the right city
    place = response["results"][0]["locations"][0]

    #tentatively Hong Kong for testing purposes
    city = "Hong Kong"

    if place["adminArea5"].include?(city) || place["adminArea4"].include?(city) || place["adminArea3"].include?(city) || place["adminArea1"].include?(city)
      cookies.permanent.signed[:in_boston] = true

      #redirect to verified page
      headers["Status"] = "301 Moved Permanently"
      flash[:success] = "Welcome to Clowder!"
      redirect_to(home_url)
    else
      flash[:block] = "Sorry, we do not support your location yet. Check back later!"
      redirect_to(root_url)
    end 

  end


end
