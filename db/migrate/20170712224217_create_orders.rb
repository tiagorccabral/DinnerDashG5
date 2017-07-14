class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.string :status, default: "in process"
      t.integer  :quantity
      t.float    :subtotal
      t.timestamps
    end
  end
end
