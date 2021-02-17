class Api::V1::ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:user).order(created_at: :desc)

    render json: @items
  end

  def destroy
    @item = Item.find(params[:item_id])
    @item.destroy!

    render json: @items
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: item
    else
      render status: 400, json: { status: 400, message: 'この商品はすでにお気に入り登録済みです。お気に入り解除はマイページから行ってください。' }
    end
  end

  def favorites
    @favorite_items = Item.where(user_id: params[:user_id]).order(created_at: :desc)

    render json: @favorite_items
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :url, :image, :review_count, :review_average, :shop_name, :genre_id, :user_id, :item_code)
  end
end
