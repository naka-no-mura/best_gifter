class Api::V1::RakutenSearchesController < ApplicationController

  RakutenWebService.configure do |config|
    config.application_id = ENV['RAKUTEN_API_APPLICATION_ID']
  end

  def search
    @items = RakutenWebService::Ichiba::Item.search(keyword: '結婚' + params[:keyword], giftFlag: 1)

    render json: @items
  end
end