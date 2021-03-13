require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  describe 'ログイン機能' do
    let(:user) { create(:user) }

    describe 'ログイン前' do
      before do
        visit '/login'
      end

      context '全ての入力が正常なとき' do
        it 'ログインに成功する' do
          fill_in 'login-email', with: user.email
          fill_in 'login-password', with: 'password'
          click_on 'login-btn'
          expect(page).to have_current_path('/items')
          expect(page).to have_content('ログインしました')
        end
      end

      context '各項目が未入力の場合' do
        it 'ログインに失敗する' do
          fill_in 'login-email', with: ''
          fill_in 'login-password', with: ''
          click_on 'login-btn'
          expect(page).to have_content('正しいメールアドレスを入力してください')
          expect(page).to have_content('正しいパスワードを入力してください')
          expect(page).to have_current_path('/login')
        end
      end

      context 'パスワードが間違っている時' do
        it 'ログインに失敗する' do
          fill_in 'login-email', with: user.email
          fill_in 'login-password', with: 'wrongpassword'
          click_on 'login-btn'
          expect(page).to have_content('正しいメールアドレスを入力してください')
          expect(page).to have_content('正しいパスワードを入力してください')
          expect(page).to have_current_path('/login')
        end
      end
    end

    describe 'ログイン後' do
      it 'ログアウトできる' do
        login_as(user)
        expect(page).to have_content('ログアウト')
        click_on 'ログアウト'
        expect(page.driver.browser.switch_to.alert.text).to eq "ログアウトしますか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_current_path('/')
      end
    end
  end
end