class Questionnaire < ApplicationRecord
  belongs_to :user
  has_many :questionnaire_choices
  has_many :answers, through: :questionnaire_choices
end
