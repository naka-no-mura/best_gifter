class AddAnswersCountToQuestionnaireChoices < ActiveRecord::Migration[6.0]
  def self.up
    add_column :questionnaire_choices, :answers_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :questionnaire_choices, :answers_count
  end
end
