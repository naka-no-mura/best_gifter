require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    user = create(:user)
    questionnaire = create(:questionnaire)
    questionnaire_choice = create(:questionnaire_choice)
  end

  it 'user_id, questionnaire_choice_id, questionnaire_idがあれば正常にアンケート投票できること' do
    user = create(:user)
    questionnaire = create(:questionnaire)
    questionnaire_choice = create(:questionnaire_choice)
    answer = Answer.new(
      user_id: user.id,
      questionnaire_id: questionnaire.id,
      questionnaire_choice_id: questionnaire_choice.id
    )
    expect(answer).to be_valid
  end

  xit 'user_idがなかったらアンケート投票に失敗すること' do
    answer = build(:user, id: nil)
    answer.valid?
    expect(answer.errors[:user_id]).to include('を入力してください')
  end

  xit 'questionnaire_idがなかったらアンケート投票に失敗すること' do
    answer = build(:questionnaire, id: nil)
    answer.valid?
    expect(answer.errors[:questionnaire_id]).to include('を入力してください')
  end

  xit 'questionnaire_choice_idがなかったらアンケート投票に失敗すること' do
    answer = build(:questionnaire_choice, id: nil)
    answer.valid?
    expect(answer.errors[:questionnaire_choice_id]).to include('を入力してください')
  end
end
