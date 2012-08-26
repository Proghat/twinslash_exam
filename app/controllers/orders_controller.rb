class OrdersController < ApplicationController
  load_and_authorize_resource
  before_filter :check_complete_permissions, only: [:create, :update]

  def index
    @orders = @orders.completed if params[:list] == 'completed'
    @orders = @orders.uncompleted if params[:list] == 'uncompleted'
  end

  def create
    @order.user_id = current_user.id
    if @order.save
      redirect_to orders_url, notice: 'Order was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @order.update_attributes(params[:order])
      redirect_to orders_url, notice: 'Order was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @order.destroy

    redirect_to orders_url
  end

private
  def check_complete_permissions
    authorize! :complete, @order if params[:order][:completion]
  end
end
