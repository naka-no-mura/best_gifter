require 'rails_helper'
require 'webmock/rspec'
include WebMock::API

RSpec.describe "Items", type: :request do
  before do
    WebMock.enable!
    WebMock.stub_request(:get, 'www.example.com').
    # WebMock.stub_request(:get, 'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?format=json&keyword=%E7%B5%90%E5%A9%9A%20%E3%82%BF%E3%82%AA%E3%83%AB&minPrice=3000&maxPrice=5000&sort=standard&giftFlag=1&imageFlag=1&page=1&applicationId=1092280411653960373').
    # with(body: ).
    to_return(
      body: JSON.generate({
        itemName: 'ギフト 日本製 今治タオルセット (個別送料込み価格) | タオルギフト　結婚内祝い',
        itemPrice: 4193,
        itemUrl: 'https://item.rakuten.co.jp/tabaki/tkd-wi-000019/',
        mediumImageUrls: [{ imageUrl: 'https://thumbnail.image.rakuten.co.jp/@0_mall/tabaki/cabinet/2019newguideline/tkd-wi-61551-u.jpg?_ex=128x128' }],
        reviewCount: 4,
        reviewAverage: 5,
        shopName: 'たばき ギフト館',
        genreId: '565606',
        itemCode: 'tabaki:10311831'
      }),
      status: 200,
      headers: { "Content-Type" =>  "application/json" }
    )
  end

  describe ':get api' do

      it '200 stauts 実際のHTTPリクエストにしてみる' do
        Net::HTTP.get("https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?format=json&keyword=%E7%B5%90%E5%A9%9A%20%E3%82%BF%E3%82%AA%E3%83%AB&minPrice=3000&maxPrice=5000&sort=standard&giftFlag=1&imageFlag=1&page=1&applicationId=1092280411653960373", "/")
        expect(response.status).to ex(200)
      end

      it '200 stauts www.example.comでqueryをくっつけないとき' do
        Net::HTTP.get("www.example.com", "/")
        expect(response.status).to ex(200)
      end

      it '200 stauts www.example.comでqueryをくっつけたとき' do
        Net::HTTP.get("www.example.com", "/?minPrice=3000&maxPrice=5000")
        expect(response.status).to ex(200)
      end
  end
end
