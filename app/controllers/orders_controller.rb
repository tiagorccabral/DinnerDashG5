class OrdersController < ApplicationController
  def new
  end

  private
  def item_params
    params.require(:order).permit(:status, :user_id, :quantity, :subtotal, item_ids:[])
  end
end
