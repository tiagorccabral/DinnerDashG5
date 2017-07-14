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
      chave = current_user.username
      session[:current_cart].delete(chave)
      redirect_to items_path
    end
  end

  def show
    @order = Order.find(params[:id])
    @items = {}
  end

  def destroy
    @order = Order.find(params[:id])
    @order.status = "canceled"
    @order.save
    flash[:success] = "Successfully canceled..."
    redirect_to orders_path
  end

  private
    def order_params
      params.require(:order).permit(:quantity,:subtotal,:user_id,item_ids: [])
    end
    def item_params
      params.require(:order).permit(:status, :user_id, :quantity, :subtotal, item_ids:[])
    end
end
