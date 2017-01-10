class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)          #"needs index page"
  end

  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :bio, :photo, :zipcode)
  end

end
