FactoryBot.define do
  factory :answer do
    association :user, factory: :user
    association :questionnaire, factory: :questionnaire
    association :questionnaire_choice, factory: :questionnaire_choice
  end
end