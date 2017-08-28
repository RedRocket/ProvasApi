class Api::CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: @cities.to_json(), status: :ok
  end

  #
  # Return group of universities in a city
  #
  def universities_in_city
    universities = City.find(params[:id]).universities.order(name: :asc)

    render json: universities.to_json(), status: :ok
  end

  #
  # Add view to specific city
  #
  def add_view
    @city = City.find(params[:id])

    value = @city.views+ 1

    @city.update(views: value)

    render json: @city.to_json(), status: :ok
  end
end
