class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.integer :price, null: false
      t.string :url, null: false
      t.string :image
      t.integer :review_count, null: false
      t.float :review_average, null: false
      t.string :shop_name, null: false
      t.integer :genre_id, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
