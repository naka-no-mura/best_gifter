class Api::V1::RakutenSearchesController < ApplicationController

  RakutenWebService.configure do |config|
    config.application_id = ENV['RAKUTEN_API_APPLICATION_ID']
  end

  def search
    @items = RakutenWebService::Ichiba::Item.search(
      keyword: params[:keyword],
      genreId: params[:genreId],
      minPrice: params[:minPrice],
      maxPrice: params[:maxPrice],
      sort: params[:sort],
      giftFlag: 1
    )

    render json: @items
  end
end
