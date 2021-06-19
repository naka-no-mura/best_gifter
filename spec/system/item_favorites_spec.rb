require 'rails_helper'

RSpec.describe "Items", type: :system, js: true  do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }

  before do 
    login_as(user)
    visit '/items'
  end

  it 'お気に入り登録ができること', js: true  do
    first('.mask').hover
    first('.favorite-btn').click
    expect(page).to have_content('お気に入りに登録しました')
  end

  it 'すでにお気に入り登録した商品は再度お気に入り登録できないこと', js: true  do
    first('.mask').hover
    first('.favorite-btn').click
    first('.favorite-btn').click
    expect(page).to have_content('この商品はすでにお気に入り登録済みです。お気に入り解除はマイページから行ってください。')
  end
end
