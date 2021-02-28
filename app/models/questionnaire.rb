class Questionnaire < ApplicationRecord
  belongs_to :user
  has_many :questionnaire_choices, dependent: :destroy
  has_many :answers, through: :questionnaire_choices, dependent: :destroy

  validates :text, presence: true
  validates :relationship, presence: true
  validates :gender, presence: true
  validates :age, presence: true
end
