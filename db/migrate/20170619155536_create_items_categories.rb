class CreateItemsCategories < ActiveRecord::Migration[5.1]
  def self.up
    create_table :categories_items, :id => false do |t|
      t.integer :category_id
      t.integer :item_id
    end
  end
 
  def self.down
    drop_table :categories_items
  end
end
