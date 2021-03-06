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
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.id = session[:user_id]
      session[:user_id] == nil
      @user.destroy
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :about, :password, :password_confirmation, :image)
  end

  def find_user
    @user = User.find(params[:id])
  end

end