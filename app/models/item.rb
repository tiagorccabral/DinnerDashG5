class Item < ApplicationRecord
	has_and_belongs_to_many :categories

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :price, numericality: { greater_than: 0 }
end
