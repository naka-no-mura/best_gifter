require 'rails_helper'

RSpec.describe "Mypages", type: :system do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }
  
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
end
