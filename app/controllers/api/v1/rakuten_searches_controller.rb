# class Api::V1::RakutenSearchesController < ApplicationController
#   require 'httpclient'

#   # SDKを使った場合

#   # RakutenWebService.configure do |config|
#   #   config.application_id = ENV['RAKUTEN_API_APPLICATION_ID']
#   # end

#   # def search
#   #   @items = RakutenWebService::Ichiba::Item.search(
#   #     keyword: params[:keyword],
#   #     genreId: params[:genreId],
#   #     minPrice: params[:minPrice],
#   #     maxPrice: params[:maxPrice],
#   #     sort: params[:sort],
#   #     giftFlag: 1,
#   #     imageFlag: 1
#   #   )

#   #   render json: @items
#   # end

#   # 指定のリクエストURLの場合

#   def index
    
#     # binding.pry
    
#     url = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706"  # URLを設定
#     _params = {
#       applicationId: ENV['RAKUTEN_API_APPLICATION_ID'],
#       keyword: params[:keyword],
#       genreId: params[:genreId],
#       minPrice: params[:minPrice],
#       maxPrice: params[:maxPrice],
#       sort: params[:sort],
#       giftFlag: 1,
#       imageFlag: 1
#     }
#     client = HTTPClient.new                 # インスタンスを生成
#     response = client.get(url, _params)              # Getリクエスト
#     render json: JSON.parse(response.body)  # 結果をjsonにパースして表示
#   end
# end
