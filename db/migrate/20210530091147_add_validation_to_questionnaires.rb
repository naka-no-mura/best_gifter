class AddValidationToQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    change_column :questionnaires, :text, :text, null: false, limit: 140
    change_column :questionnaires, :relationship, :string, null: false, limit: 30
    change_column :questionnaires, :age, :string, null: false, limit: 10
  end
end
