require 'rails_helper'

RSpec.describe "Mypages", type: :system do
  let!(:user) { create(:user) }
  
  before do
    login_as(user)
    visit '/items'
    first('.is-not-liked').click
    visit '/mypage'
    get '/api/v1/items/favorites'
  end

  describe 'お気に入り登録機能' do
    context '星マークをクリックしたとき' do
      it 'お気に入りから外せる' do
        find('#my-is-liked').click
        expect(page).to_not have_content('#my-is-liked')
      end
    end
  end

  describe 'アンケート機能' do
    context 'マイページからアンケート投稿ページに移動したいとき' do
      it '遷移が成功する' do
        click_on '投稿する'
        expect(page).to have_current_path('/questionnaire_form')
      end
    end

    context '自分の投稿を削除したいとき' do
      it '「削除」をクリックで削除に成功する' do
        visit '/questionnaire_form'
        fill_in 'q-relatinoship', with: '高校時代の同級生'
        select '男性', from: 'q-gender'
        fill_in 'q-age', with: '25歳'
        fill_in 'q-text', with: '高校時代からの仲で社会人になっても頻繁に飲みにいく関係です'
        fill_in 'q-first-choice', with: '1万円のワイン'
        fill_in 'q-second-choice' , with: '温泉旅行ペアチケット'
        fill_in 'q-third-choice', with: '友人3人で1万円ずつ出してお掃除ロボット'
        click_on 'q-post'
        visit '/mypage'
        get '/api/v1/questionnaires/my_questionnaires'
        click_on '削除'
        expect(page.driver.browser.switch_to.alert.text).to eq "アンケートを削除してもよろしいでしょうか？一度削除すると、元には戻せません。"
        page.driver.browser.switch_to.alert.accept
        expect(page).to_not have_content('ギフトを贈りたい相手の')
      end
    end
  end
end
