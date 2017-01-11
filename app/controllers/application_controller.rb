class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :need_belongs_to_user?, :authorize_user, :logged_in?, :need_expiration_formatted


  def logged_in?
    !!session[:user_id]
  end


  def set_user
    if logged_in?
      @user = User.find(session[:user_id])
    else
      false
    end
  end

  def authorize_user
    unless logged_in?
      redirect_to signin_path
    end
  end

  def need_belongs_to_user?
    @need.user.id == @user.id
  end

  def need_expiration_formatted
    @need.expiration.strftime("%B %d, %Y")
  end

end
