class CreateItemsOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :item_orders do |t|
      t.integer  :item_id
      t.integer  :order_id
      t.integer  :quantity
      t.float    :subtotal
    end
  end
end
