class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @user = current_user
  end
  def new
  end
  def create
    @items_ids = params
    @order = Order.new(order_params)
    if @order.save
      redirect_to items_path
    end
  end
  def show
    @orders = Order.all
    @category = Order.find(params[:id])
    @items = []
  end
  private
    def order_params
      params.require(:order).permit(:quantity,:subtotal,:user_id,item_ids: [])
    end
    def item_params
      params.require(:order).permit(:status, :user_id, :quantity, :subtotal, item_ids:[])
    end
end
