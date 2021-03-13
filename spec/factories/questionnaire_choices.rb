FactoryBot.define do
  factory :questionnaire_choice do
    association :questionnaire, factory: :questionnaire
    sequence(:choice) { |n| "選択肢-#{n}" }
  end
end