class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :check_change_role_permissions, only: [:create, :update]

  def create
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url
  end

private
  def check_change_role_permissions
    authorize! :change_role, @user if params[:user][:role]
  end
end
