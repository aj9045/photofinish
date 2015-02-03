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
    if @photo.save
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
    if @photo.user_id = session[:user_id]
      @photo.destroy
      redirect_to root_path
    else
      redirect_to @user
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :user_id)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end


end