require 'rails_helper'
require 'webmock/rspec'
include WebMock::API

RSpec.describe "Items", type: :request do
  before do
    WebMock.enable!
  end

  describe ':get api' do

    context '全ての入力が正常なとき' do
      it '200 stauts' do
        stub_request(:get, 'http://localhost:3000/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+%E3%82%BF%E3%82%AA%E3%83%AB&genreId=&minPrice=3000&maxPrice=5000&sort=standard&giftFlag=1&imageFlag=1&page=1').to_return(
          body: JSON.generate({
            itemName: 'ギフト 今治タオル 金星 (きんぼし) (-61551-) (t0) 日本製 愛媛今治 木箱入り 今治タオルセット (個別送料込み価格) | タオルギフト 出産内祝い 結婚内祝い 快気祝い 香典返し たおる 国産',
            itemPrice: 4193,
            itemUrl: 'https://item.rakuten.co.jp/tabaki/tkd-wi-000019/',
            mediumImageUrls: [{ imageUrl: 'https://thumbnail.image.rakuten.co.jp/@0_mall/tabaki/cabinet/2019newguideline/tkd-wi-61551-u.jpg?_ex=128x128' }],
            reviewCount: 4,
            reviewAverage: 5,
            shopName: 'たばき ギフト館',
            genreId: '565606',
            itemCode: 'tabaki:10311831'
          }),
          status: 200
        )
        Net::HTTP.get("http://localhost:3000/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+%E3%82%BF%E3%82%AA%E3%83%AB&genreId=&minPrice=3000&maxPrice=5000&sort=standard&giftFlag=1&imageFlag=1&page=1", "/")
      end
    end
  end
end
