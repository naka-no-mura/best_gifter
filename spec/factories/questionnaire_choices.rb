FactoryBot.define do
  factory :questionnaire_choice do
    questionnaire
    sequence(:choice) { |n| "選択肢-#{n}" }
  end
end