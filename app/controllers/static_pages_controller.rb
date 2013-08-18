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
    cookies.signed[:in_boston] = true
    lat = params[:verify_lat]
    long = params[:verify_long]
    render text: lat + " " + long
    #redirect_to(action: 'verified_home')
  end

  def verified_home
    if !cookies.signed[:in_boston]
      redirect_to(action: 'home')
    else

    end
  end

end
