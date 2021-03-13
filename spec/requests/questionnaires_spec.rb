require 'rails_helper'

RSpec.describe "Items", type: :system do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }

  before do 
    login_as(user)
    visit '/questionnaire_form'
  end

  describe 'アンケート投稿機能' do
    context '全ての入力が正常なとき' do
      it '投稿が成功する' do
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
        # expect(page).to change('#q-id', :count).from(1).to(1)
        expect(page).to have_content('ギフトを贈りたいお相手について', count: 1)
      end
    end

    # context 'post' do
    #   it '成功する' do
    #     valid_params = { age: "25歳", gender: "男性", relationship: "高校時代の同級生", text: "高校時代からの仲で社会人になっても頻繁に飲みにいく関係です", user_id: user.id }
    #     expect { post '/api/v1/questionnaires', params: { questionnaire: valid_params } }
    #     expect(response.status).to eq(200)
    #   end
    # end

    # context '' do
    #   it '' do
        
    #   end
    # end

    # context '' do
    #   it '' do
        
    #   end
    # end

    # context '' do
    #   it '' do
        
    #   end
    # end
  end

end
