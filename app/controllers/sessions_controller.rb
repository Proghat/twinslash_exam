class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
    else
      flash[:error] = 'Unknown pair email/password'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out.'
  end
end
