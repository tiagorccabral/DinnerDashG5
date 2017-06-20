class RemoveCategoryFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :category, :string
  end
end
