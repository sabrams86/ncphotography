class HomeController < ApplicationController

  def index
    @albums = Album.includes(:photos).all
  end

  def admin
  end

end
