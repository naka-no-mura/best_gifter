class Api::ItemsController < ApplicationController
  def search
    if params[:keyword]&&[:genreId]
      @items = RakutenWebService::Ichiba::Item.search(keyword: '結婚' + params[:keyword], genreId: params[:genreId] ,giftFlag: 1)
    end
  end
end
