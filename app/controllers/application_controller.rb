class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :need_belongs_to_user?, :authorize_user, :logged_in?, :need_expiration_formatted, :new_reply_instance, :current_user, :default_button_class, :small_button_class

  require 'date'

  def logged_in?
    if session[:user_id]
      track_login
    end
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

  def track_login
    binding.pry
    if session[:login_date].class == Date || session[:login_date].class == String
      if session[:login_date].class == Date && session[:login_date] < Date.current
        session[:login_date] = Date.current
        @user = User.find(session[:user_id])
        @user.update_login_history
        @user.save
      elsif session[:login_date].class == String && Date.parse(session[:login_date]) < Date.current
        session[:login_date] = Date.current
        @user = User.find(session[:user_id])
        @user.update_login_history
        @user.save
      end
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
