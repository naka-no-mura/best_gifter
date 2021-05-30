class QuestionnaireChoice < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  validates :choice, presence: true, length: { maximum: 30 }
end
