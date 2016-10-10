class Api::FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(exam_id: params["exam_id"], user_id: params["user_id"])

    render json: @favorite.to_json(), status: :ok
  end

  def destroy
    @favorite = Favorite.where(exam_id: params["exam_id"], user_id: params["user_id"])

    if(@favorite != nil)
      @favorite.destroy
    end
    render json: {}.to_json(), status: :ok
  end

  def index
    @favorites = User.find_by(id: params["id"]).favorites.pluck(:exam_id)

    render json: @favorites.to_json(), status: :ok
  end
end
