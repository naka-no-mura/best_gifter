class Api::V1::FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(item_id: params[:item_id])
    favorite.save!

    render json: favorite
  end

  def destroy
    current_user.favorites.find_by(item_id: params[:item_id]).destroy!

    # ここ調整
    render json: favorite
  end
end
