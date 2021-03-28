require 'rails_helper'

RSpec.describe "Common", type: :system do
  describe 'ヘッダーの表示' do
    let(:user) { create(:user) }

    context 'ログイン前' do
      it 'ヘッダーが正しく表示されている', js: true  do
        visit root_path
        expect(page).to have_content('トップ')
        expect(page).to have_content('検索')
        expect(page).to have_content('新規登録')
        expect(page).to have_content('ログイン')
      end
    end

    context 'ログイン後' do
      it 'ヘッダーが正しく表示されている', js: true  do
        login_as(user)
        visit root_path
        expect(page).to have_content('トップ')
        expect(page).to have_content('検索')
        expect(page).to have_content('アンケート')
        expect(page).to have_content('マイページ')
        expect(page).to have_content('ログアウト')
      end
    end
  end

  describe 'フッダーの表示' do
    it '正しく表示されている', js: true  do
      visit root_path
        expect(page).to have_content('利用規約')
        expect(page).to have_content('プライバシーポリシー')
        find('#twitter')
    end
  end

  describe '利用規約の表示' do
    it '正しく表示されている', js: true  do
      visit root_path
      find('#terms').click
      expect(page).to have_current_path('/terms')
    end
  end

  describe 'プライバシーポリシー' do
    it '正しく表示されている', js: true  do
      visit root_path
      find('#privacy_policys').click
      expect(page).to have_current_path('/privacy_policys')
    end
  end
end