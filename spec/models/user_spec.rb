require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name, email, password, password_confirmationがあれば正常にユーザー登録できること' do
    user = User.new(
      name: 'テストユーザー',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password',
    )
    expect(user).to be_valid
  end

  it 'nameがなかったらユーザー登録に失敗すること' do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end

  it 'emailがなかったらユーザー登録に失敗すること' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it '重複するemailの場合、ユーザー登録に失敗すること' do
    user = create(:user)
    other_user = build(:user)
    other_user.email = user.email
    other_user.valid?
    expect(other_user.errors[:email]).to include('はすでに存在します')
  end

  it 'パスワードが3文字未満の場合、ユーザー登録に失敗すること' do
    user = build(:user)
    user.password = 'pp'
    user.valid?
    expect(user.errors[:password]).to include("は3文字以上で入力してください")
  end

  it 'パスワードが31文字以上の場合、ユーザー登録に失敗すること' do
    user = build(:user)
    user.password = 'p' * 31
    user.valid?
    expect(user.errors[:password]).to include("は30文字以内で入力してください")
  end
end
