class OrdersController < ApplicationController
  load_and_authorize_resource
  before_filter :check_complete_permissions, only: [:create, :update]

  def index
#    @orders = Order.all
    @orders = @orders.completed if params[:list] == 'completed'
    @orders = @orders.uncompleted if params[:list] == 'uncompleted'
  end

  def show
#    @order = Order.find(params[:id])
  end

  def new
#    @order = Order.new
  end

  def edit
#    @order = Order.find(params[:id])
  end

  def create
#    @order = Order.new(params[:order])

    @order.user_id = current_user.id
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render action: "new"
    end
  end

  def update
#    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      p params[:order]
      render action: "edit"
    end
  end

  def destroy
#    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_url
  end

private
  def check_complete_permissions
    authorize! :complete, @order if params[:order][:completion]
  end
end
