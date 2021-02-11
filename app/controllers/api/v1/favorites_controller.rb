class Api::V1::FavoritesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    current_user.favorite(item)
  end

  def destroy
    item = current_user.favorites.find(params[:id]).item
    current_user.unfavorite(item)
  end
end
