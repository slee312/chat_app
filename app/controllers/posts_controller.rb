class PostsController < ApplicationController
    layout 'logged'
  def verified_home
    if !cookies.signed[:in_boston]
      redirect_to(root_url)
    else


    end
  end
end
