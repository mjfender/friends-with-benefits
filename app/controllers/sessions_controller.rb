class SessionsController < ApplicationController
require 'date'
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # checks logging-in users to see what their last login date was and updates it
      if @user.logins_last < Date.current 
        @user.update_login_history
        @user.save
      end
      session[:login_date] = Date.current
      track_login
      redirect_to user_path(@user)
    else
      flash[:notice] = "You entered the wrong email and/or password. Try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out! We'll see you next time!"
    redirect_to '/'
  end

end
