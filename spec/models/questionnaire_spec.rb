require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  before do
    user = create(:user)
  end

  it 'user_id, text, relationship, gender, ageがあれば正常にユーザー登録できること' do
    user = create(:user)
    questionnaire = Questionnaire.new(
      user_id: user.id,
      text: 'どれをプレゼントしたらいいか迷う',
      relationship: '高校の同級生',
      gender: '男性',
      age: '24歳',
    )
    expect(questionnaire).to be_valid
  end

  it 'textがなかったらアンケート投稿に失敗すること' do
    questionnaire = build(:questionnaire, text: nil)
    questionnaire.valid?
    expect(questionnaire.errors[:text]).to include('を入力してください')
  end

  it 'relationshipがなかったらアンケート投稿に失敗すること' do
    questionnaire = build(:questionnaire, relationship: nil)
    questionnaire.valid?
    expect(questionnaire.errors[:relationship]).to include('を入力してください')
  end

  it 'genderがなかったらアンケート投稿に失敗すること' do
    questionnaire = build(:questionnaire, gender: nil)
    questionnaire.valid?
    expect(questionnaire.errors[:gender]).to include('を入力してください')
  end

  it 'ageがなかったらアンケート投稿に失敗すること' do
    questionnaire = build(:questionnaire, age: nil)
    questionnaire.valid?
    expect(questionnaire.errors[:age]).to include('を入力してください')
  end
end
