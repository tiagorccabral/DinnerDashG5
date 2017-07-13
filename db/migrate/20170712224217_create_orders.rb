class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :Status, default: "em andamento"
      t.float :value
      t.float :amount
      t.belongs_to :user
      t.timestamps
    end
  end
end
