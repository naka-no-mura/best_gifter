class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:user).order(created_at: :desc)

    render json: @items
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
    @favorite_items = Item.where(user_id: params[:user_id])

    render json: @favorite_items
    # @favorite_items = current_user.favorite_items.includes(:user).order(created_at: :desc)

    # render json: @favorite_items
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :url, :image, :review_count, :review_average, :shop_name, :genre_id, :user_id)
  end
end
