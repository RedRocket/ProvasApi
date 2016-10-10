class Api::FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(user_params)

    render json: @favorite.to_json(), status: :ok
  end

  def destroy
    @favorite = Favorite.find(params["id"])

    @favorite.destroy

    render json: {}.to_json(), status: :ok
  end

  def index
    @favorites = User.find_by(id: params["id"]).favorites.pluck(:exam_id)

    render json: @favorites.to_json(), status: :ok
  end
end
