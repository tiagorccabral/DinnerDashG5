class CreateItemsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_categories do |t|
      t.integer :item_id
      t.integer :category_id
    end
  end
end
