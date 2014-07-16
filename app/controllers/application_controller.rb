class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 
  before_action :require_login

  helper_method :current_user

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
