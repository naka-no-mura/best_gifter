require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

    describe 'ヘッダー' do
      it '「新規登録」、「ログイン」ボタンが表示されている' do
        visit root_path
        expect(page).to have_content('新規登録')
        expect(page).to have_content('ログイン')
      end
    end

    describe 'ユーザー登録機能' do
     before do
       visit root_path
       click_link '新規登録'
     end

      context '全ての入力が正常なとき' do
        it 'ユーザー登録に成功する' do
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
end
