class UsersController < ApplicationController
require 'date'
  def index
    @users = User.all
  end

  def new
    if set_user
      redirect_to user_path(@user)
    else
      @user = User.new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = Event.upcoming_and_past(@user.id)
  end

  def create
    @user = User.new(user_params)
    @user.groups << Group.find(1)
    @user.default_group = 1
    @user.save
    if @user.save
      session[:user_id] = @user.id
      session[:login_date] = Date.current
      @user.update_login_history
      @user.save
      redirect_to user_path(@user)
    else
      flash[:notice] = "Missing required fields. Please enter at least a name, an email, and a password."
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Your account has successfully been deleted. Thanks for coming by!"
    redirect_to root_path
  end

  def set_default_group
    set_user
    @user.default_group = params[:group_id]
    @user.save
    @group = Group.find(params[:group_id])
    flash[:notice] = "#{@group.title} is now your default group"
    redirect_to @group
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :bio, :photo, :zipcode, :avatar)
  end

end
