class Api::V1::RakutenApisController < ApplicationController
  require 'httpclient'

  def search
    url = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706"  # URLを設定
    _params = {
      applicationId: ENV['RAKUTEN_API_APPLICATION_ID'],
      keyword: params[:keyword],
      genreId: params[:genreId],
      minPrice: params[:minPrice],
      maxPrice: params[:maxPrice],
      sort: params[:sort],
      giftFlag: 1,
      imageFlag: 1,
      page: params[:page],
    }
    client = HTTPClient.new                 # インスタンスを生成
    response = client.get(url, _params)              # Getリクエスト
    render json: JSON.parse(response.body)  # 結果をjsonにパースして表示
  end
end
