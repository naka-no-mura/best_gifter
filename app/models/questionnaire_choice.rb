class QuestionnaireChoice < ApplicationRecord
  belongs_to :questionnaire
  validates :choice, presence: true
end
