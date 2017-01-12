class UsersController < ApplicationController

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
  end

  def create
    @user = User.new(user_params)
    @user.groups << Group.find(1)
    @user.save 
    session[:user_id] = @user.id
    redirect_to user_path(@user)
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


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :bio, :photo, :zipcode, :avatar)
  end

end
