class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :about, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

end