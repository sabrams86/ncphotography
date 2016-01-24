class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    @album = Album.new
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to photos_path
    else
      render "index"
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.save
      redirect_to photos_path
    else
      render "index"
    end
  end

  def destroy
    if Album.find(params[:id]).destroy
      flash[:success] = "Album Deleted"
      redirect_to photos_path
    else
      flash[:error] = "Error, please try again"
      render "index"
    end
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end
end
