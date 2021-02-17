class CreateQuestionnaireChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaire_choices do |t|
      t.references :questionnaire, null: false, foreign_key: true
      t.string :choice, null: false

      t.timestamps
    end
  end
end
