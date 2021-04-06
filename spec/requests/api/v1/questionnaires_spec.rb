require 'rails_helper'

RSpec.describe "Items", type: :system, js: true  do
  let!(:user) { create(:user) }

  
  describe 'アンケートを投稿する' do
    before do 
      login_as(user)
      visit '/questionnaire_form'
    end

    context '全ての入力が正常なとき', js: true  do
      it '投稿が成功する', js: true  do
        fill_in 'q-relatinoship', with: '高校時代の同級生'
        select '男性', from: 'q-gender'
        fill_in 'q-age', with: '25歳'
        fill_in 'q-text', with: '高校時代からの仲で社会人になっても頻繁に飲みにいく関係です'
        fill_in 'q-first-choice', with: '1万円のワイン'
        fill_in 'q-second-choice' , with: '温泉旅行ペアチケット'
        fill_in 'q-third-choice', with: '友人3人で1万円ずつ出してお掃除ロボット'
        click_on 'q-post'
        expect(page).to have_content('アンケートを投稿しました。結果はマイページからいつでも確認できます。')
        visit '/questionnaire_list'
        get '/api/v1/questionnaires'
        expect(page).to have_content('ギフトを贈りたいお相手について', count: 1)
      end
    end

    context '全ての入力が正常だが３つ目の選択肢だけ空欄のとき', js: true  do
      it '「結果だけ見る」という選択肢が３つ目に作成され、投稿が成功する', js: true  do
        fill_in 'q-relatinoship', with: '高校時代の同級生'
        select '男性', from: 'q-gender'
        fill_in 'q-age', with: '25歳'
        fill_in 'q-text', with: '高校時代からの仲で社会人になっても頻繁に飲みにいく関係です'
        fill_in 'q-first-choice', with: '1万円のワイン'
        fill_in 'q-second-choice' , with: '温泉旅行ペアチケット'
        fill_in 'q-third-choice', with: ''
        click_on 'q-post'
        expect(page).to have_content('アンケートを投稿しました。結果はマイページからいつでも確認できます。')
        visit '/questionnaire_list'
        get '/api/v1/questionnaires'
        expect(page).to have_content('ギフトを贈りたいお相手について', count: 1)
        expect(page).to have_content('結果だけ見る')
      end
    end

    context '各項目が未入力の場合', js: true  do
      it '投稿に失敗する', js: true  do
        fill_in 'q-relatinoship', with: ''
        # select '', from: 'q-gender'
        fill_in 'q-age', with: ''
        fill_in 'q-text', with: ''
        fill_in 'q-first-choice', with: ''
        fill_in 'q-second-choice' , with: ''
        fill_in 'q-third-choice', with: ''
        click_on 'q-post'
        expect(page).to have_content('必須項目です', count: 6)
        visit '/questionnaire_list'
        get '/api/v1/questionnaires'
        expect(page).to have_content('ギフトを贈りたいお相手について', count: 0)
      end
    end
  end

  describe 'アンケートに投票する', js: true  do
    before do 
      login_as(user)
      visit '/questionnaire_form'
      fill_in 'q-relatinoship', with: '高校時代の同級生'
      select '男性', from: 'q-gender'
      fill_in 'q-age', with: '25歳'
      fill_in 'q-text', with: '高校時代からの仲で社会人になっても頻繁に飲みにいく関係です'
      fill_in 'q-first-choice', with: '1万円のワイン'
      fill_in 'q-second-choice' , with: '温泉旅行ペアチケット'
      fill_in 'q-third-choice', with: '友人3人で1万円ずつ出してお掃除ロボット'
      click_on 'q-post'
      visit '/questionnaire_list'
      get '/api/v1/questionnaires'
    end

    context 'アンケートに投票したとき', js: true  do
      xit 'vote数が1になる', js: true  do
        find('1万円のワイン').click
        expect(page).to have_content('アンケートに投票しました')
        expect(page).to have_content('1 votes')
      end
    end
  end
end
