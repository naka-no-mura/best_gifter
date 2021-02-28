class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.references :user, null: false, foreign_key: true
      t.text :text, null: false
      t.string :relationship, null: false
      t.string :gender, null: false
      t.string :age, null: false

      t.timestamps
    end
  end
end
