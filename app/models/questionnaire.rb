class Questionnaire < ApplicationRecord
  belongs_to :user
  has_many :questionnaire_choices, dependent: :destroy
  has_many :answers, through: :questionnaire_choices, dependent: :destroy

  validates :text, presence: true, length: { maximum: 140 }
  validates :relationship, presence: true, length: { maximum: 30 }
  validates :gender, presence: true
  validates :age, presence: true, length: { maximum: 10 }
end
