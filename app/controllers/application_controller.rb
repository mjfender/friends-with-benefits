class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :need_belongs_to_user?, :authorize_user, :logged_in?, :need_expiration_formatted, :new_reply_instance, :current_user


  def logged_in?
    !!session[:user_id]
  end

  def current_user
    session[:user_id]
  end

  def set_user
    # @user = User.find(1)
    @user = User.find(session[:user_id])
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

  def new_reply_instance
    Reply.new
  end

end
