require 'rails_helper'

RSpec.describe QuestionnaireChoice, type: :model do
  before do
    user = create(:user)
    questionnaire = create(:questionnaire)
  end

  it 'questionnaire_id, choiceがあれば正常にユーザー登録できること' do
    user = create(:user)
    questionnaire = create(:questionnaire)
    questionnaire_choice = QuestionnaireChoice.new(
      questionnaire_id: questionnaire.id,
      choice: '選択肢1',
    )
    expect(questionnaire_choice).to be_valid
  end

  it 'choiceがなかったらアンケート投稿に失敗すること' do
    questionnaire_choice = build(:questionnaire_choice, choice: nil)
    questionnaire_choice.valid?
    expect(questionnaire_choice.errors[:choice]).to include('を入力してください')
  end
end
