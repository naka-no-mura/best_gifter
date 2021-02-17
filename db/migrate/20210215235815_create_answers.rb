class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :questionnaire_choice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
