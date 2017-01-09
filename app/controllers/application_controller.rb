class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def logged_in?
    !!session[:user_id]
  end

  def set_user
    @user = User.find(1)
    # @user = User.find(session[:user_id])
  end

  def authorize_user
    unless logged_in?
      redirect_to signin_path
    end
  end
end
