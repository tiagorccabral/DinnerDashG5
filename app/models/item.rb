class Item < ApplicationRecord

	has_many :item_categories
	has_many :categories, through: :item_categories

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :price, numericality: { greater_than: 0 }
end
