class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if logged_in?
      @user = User.find_by(session[:user_id])
    end
  end


  private

  def logged_in?
    !!session[:user_id]
  end

  def authenticate_user
    unless logged_in?
      redirect_to root_path
    end
  end

end
