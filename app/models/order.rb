class Order < ActiveRecord::Base
  
  has_many :item_orders
  has_many :items, through: :item_orders

  validates :value, presence: true
  validates :amount, presence: true
end
