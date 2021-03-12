require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ヘッダー' do
      it '「新規登録」、「ログイン」ボタンが表示されている' do
        visit root_path
        expect(page).to have_content('新規登録')
        expect(page).to have_content('ログイン')
      end
    end

    describe 'ユーザー登録機能' do
      context '全ての入力が正常なとき' do
        it 'ユーザー登録に成功する' do
          visit root_path
          click_link '新規登録'
          within "#register-form" do
            fill_in 'register-name', with: 'test'
            fill_in 'register-email', with: 'test@example.com'
            fill_in 'register-password', with: 'password'
            fill_in 'register-password-confirmation', with: 'password'
            check 'register-check'
            click_on 'register-btn'
          end
          expect(page).to have_current_path('/login')
        end
      end

      context '各項目が未入力の場合' do
        it 'ユーザー登録に失敗する' do
          visit root_path
          click_link '新規登録'
          within "#register-form" do
            fill_in 'register-name', with: ''
            fill_in 'register-email', with: ''
            fill_in 'register-password', with: ''
            fill_in 'register-password-confirmation', with: ''
            check 'register-check'
            click_on 'register-btn'
          end
          expect(page).to have_content('ニックネームを入力してください')
          expect(page).to have_content('メールアドレスを入力してください')
          expect(page).to have_content('パスワードは3文字以上で入力してください')
          expect(page).to have_content('パスワード（確認）を入力してください')
          expect(page).to have_current_path('/register')
        end
      end

      context 'emailが重複している場合' do
        it 'ユーザー登録に失敗する' do
          existed_user = create(:user)
          visit root_path
          click_link '新規登録'
          within "#register-form" do
            fill_in 'register-name', with: 'test'
            fill_in 'register-email', with: existed_user.email
            fill_in 'register-password', with: 'password'
            fill_in 'register-password-confirmation', with: 'password'
            check 'register-check'
            click_on 'register-btn'
          end
          expect(page).to have_content('メールアドレスはすでに存在します')
          expect(page).to have_current_path('/register')
        end
      end

      context 'password-confirmationが一致しない場合' do
        it 'ユーザー登録に失敗する' do
          visit root_path
          click_link '新規登録'
          within "#register-form" do
            fill_in 'register-name', with: 'test'
            fill_in 'register-email', with: 'test@example.com'
            fill_in 'register-password', with: 'password'
            fill_in 'register-password-confirmation', with: 'wrongpassword'
            check 'register-check'
            click_on 'register-btn'
          end
          expect(page).to have_content('パスワード（確認）とパスワードの入力が一致しません')
          expect(page).to have_current_path('/register')
        end
      end
    end

    describe '登録済みユーザー' do
      context '全ての入力が正常なとき' do
        it 'ログインに成功する' do
          visit '/login'
          fill_in 'login-email', with: user.email
          fill_in 'login-password', with: 'password'
          click_on 'login-btn'
            expect(page).to have_current_path('/items')
        end
      end
      
      context '各項目が未入力の場合' do
        it 'ログインに失敗する' do
          visit '/login'
          fill_in 'login-email', with: ''
          fill_in 'login-password', with: ''
          click_on 'login-btn'
          expect(page).to have_current_path('/login')
        end
      end
    end
  end

  describe 'ログイン後' do
    it 'ログイン状態でログアウトできる' do
      login_as(user)
      expect(page).to have_content('ログアウト')
      click_on 'ログアウト'
      expect(page.driver.browser.switch_to.alert.text).to eq "ログアウトしますか？"
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_current_path('/')
    end
  end
end
