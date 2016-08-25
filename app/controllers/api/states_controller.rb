class Api::StatesController < ApplicationController
  def index
    @states = State.all
    render json: @states.to_json(), status: :ok
  end

  def cities_in_state
    cities = State.find(params[:id]).cities.order(:views, name: :desc)

    highest_view = cities.first

    cities_ord = cities.order(name: :desc) - [highest_view]

    cities_ord.unshift(highest_view)

    render json: cities_ord.reverse.to_json(), status: :ok
  end
end
