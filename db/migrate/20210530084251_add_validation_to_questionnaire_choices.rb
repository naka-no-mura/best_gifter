class AddValidationToQuestionnaireChoices < ActiveRecord::Migration[6.0]
  def change
    change_column :questionnaire_choices, :choice, :string, null: false, limit: 30
  end
end
