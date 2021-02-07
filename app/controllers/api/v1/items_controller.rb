class Api::V1::ItemsController < ApplicationController
  def index
    @items = Items.all.include(:user).order(created_at: :desc)
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: item
    else
      render json: item.errors, status: :bad_request
    end
  end

  def favorites
    @favorite_items = current_user.favorite_items.include(:user).order(created_at: :desc)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :url, :image, :review_count, :review_average, :shop_name, :genre_id, :user_id)
  end
end
