class Order < ActiveRecord::Base
  validates :value, presence: true
  validates :amount, presence: true
end
