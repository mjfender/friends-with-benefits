class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.find_by(email: params[:email]).authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "You entered the wrong email and/or password. Try again."
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
