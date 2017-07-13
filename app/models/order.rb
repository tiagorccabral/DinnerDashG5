class Order < ActiveRecord::Base

  has_many :item_orders
  has_many :items, through: :item_orders

  validates :quantity, presence: true
  validates :subtotal, presence: true
end
