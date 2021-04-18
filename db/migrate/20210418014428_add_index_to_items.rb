class AddIndexToItems < ActiveRecord::Migration[6.0]
  def change
    add_index :items, [:user_id, :item_code], unique: true
  end
end
