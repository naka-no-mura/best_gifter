FactoryBot.define do
  factory :questionnaire do
    user
    text { 'どれをプレゼントしたらいいか迷う' }
    relationship { '高校の同級生' }
    gender { '男性' }
    age { '24歳' }
  end
end