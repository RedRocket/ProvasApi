class Api::StatesController < ApplicationController
  def index
    @states = State.order(:name)
    render json: @states.to_json(), status: :ok
  end

  def cities_in_state
    cities = State.find(params[:id]).cities.order(name: :asc)

    render json: cities.to_json(), status: :ok
  end
end
