class QuestionnaireChoice < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers
  validates :choice, presence: true
end
