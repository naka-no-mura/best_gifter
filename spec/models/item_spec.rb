require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'name, price, url, review_count, review_average, genre_idがあれば正常にお気に入り登録できること' do
    user = create(:user)
    item = Item.new(
      name: 'タオルギフトセット',
      price: 7480,
      url: 'https://item.rakuten.co.jp/marry-gift/sf7405pe055/',
      image: 'https://thumbnail.image.rakuten.co.jp/@0_mall/marry-gift/cabinet/event_2/iwl_gk10056_1-3.jpg?_ex=128x128',
      review_count: 551,
      review_average: 4.67,
      shop_name: 'GiftField MARRY（ギフト＆雑貨）',
      genre_id: 551736,
      user_id: user.id,
      item_code: 'marry-gift:10055907'
    )
    expect(item).to be_valid
  end
end
