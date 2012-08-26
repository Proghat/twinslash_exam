class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_signed_in?, :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    if user_signed_in?
      redirect_back_or_to root_url
    else
      redirect_to signin_url
    end
  end

  def user_signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_back_or_to(*args)
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to *args
  end
end
