class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :need_belongs_to_user?, :authorize_user, :logged_in?, :need_expiration_formatted, :new_reply_instance, :current_user, :default_button_class, :small_button_class


  def logged_in?
    !!session[:user_id]
  end

  def current_user
    session[:user_id]
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

  def new_reply_instance
    Reply.new
  end

  private

  def default_button_class
    "waves-effect waves-light btn red accent-4"
  end

  def small_button_class
    "white red-text"
  end

end
