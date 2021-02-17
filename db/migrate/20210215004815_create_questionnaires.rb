class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.references :user, null: false, foreign_key: true
      t.text :text, null: false
      t.string :relationship
      t.string :gender
      t.string :age

      t.timestamps
    end
  end
end
