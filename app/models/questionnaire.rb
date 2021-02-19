class Questionnaire < ApplicationRecord
  belongs_to :user
  has_many :questionnaire_choices
end
