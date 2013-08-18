class StaticPagesController < ApplicationController
  def home
    #temp to test features prior to verification
    cookies.delete :in_boston
    

    if cookies.signed[:in_boston]
      headers["Status"] = "301 Moved Permanently"
      redirect_to(action: 'verified_home')
    end
  end
  
  def verify_status
    lat = params[:verify_lat]
    long = params[:verify_long]

    #geocode latitude and longitude using Open MQ Geocoding API
    app_key = "Fmjtd%7Cluub25ub2g%2C2n%3Do5-9u851f" 
    response = HTTParty.get("http://open.mapquestapi.com/geocoding/v1/reverse?key=" + app_key + "&outFormat=json&location=#{lat},#{long}")
    #parse response and determine if user is in the right city
    city = response["results"][0]["locations"][0]["adminArea5"]
    render text: city

    #redirect_to(action: 'verified_home')

=begin
    if city.include? "Hong Kong"
      render text: "you are in HK"
      cookies.signed[:in_boston] = true
    else
      render text: "you are not in HK"
    end 
=end
  end

  def verified_home
    if !cookies.signed[:in_boston]
      redirect_to(action: 'home')
    else

    end
  end

end
