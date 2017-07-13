class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @user = current_user
  end
  def new
  end
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to items_path
    end
  end
  def show
  end
  private
    def order_params
      params.require(:order).permit(:value,:amount,:user_id)
    end
end
