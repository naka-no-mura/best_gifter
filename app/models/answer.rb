class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire_choice
end
