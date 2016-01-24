class PhotosController < ApplicationController

  def index
    @albums = Album.includes(:photos).all
    @photo = Photo.new
    @album = Album.new
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "Photo Saved"
      redirect_to photos_path
    else
      render "new"
    end
  end

  def destroy
    if Photo.find(params[:id]).destroy
      flash[:success] = "Photo Deleted"
      redirect_to photos_path
    else
      flash[:error] = "Error, please try again"
      render "index"
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title, :album_id)
  end

end
