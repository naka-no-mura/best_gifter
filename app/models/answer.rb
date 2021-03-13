class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire_choice
  counter_culture :questionnaire_choice
  belongs_to :questionnaire
  validates :user_id, uniqueness: { scope: :questionnaire_id, case_sensitive: false }
end
