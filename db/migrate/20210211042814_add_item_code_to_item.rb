class AddItemCodeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_code, :string, unique: true, null: false
  end
end
