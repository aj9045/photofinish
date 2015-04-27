class PhotosController < ApplicationController
  before_action :find_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
     @photo = Photo.new(photo_params)
     @user = User.find(session[:user_id])
    if valid_upload? && @photo.save
      redirect_to @photo
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo
    else
      render :edit
    end
  end

  def destroy
    if @photo.user_id == session[:user_id]
      @photo.destroy
      redirect_to root_path
    else
      redirect_to @photo
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :user_id, :photo)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def valid_upload?
    @user.photos.count == 0 || @user.photos.last.this_week == false
  end

end