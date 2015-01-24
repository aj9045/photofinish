class PhotosController < ApplicationController
  before_action :find_photo, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def photo_params
    params.require(:user).permit(:title, :description, :user_id)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end


end