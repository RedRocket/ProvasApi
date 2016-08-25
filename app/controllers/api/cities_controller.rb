class Api::CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: @cities.to_json(), status: :ok
  end

  def universities_in_city
    universities = City.find(params[:id]).universities.order(:views, name: :desc)

    highest_view = universities.first

    universities_ord = universities.order(name: :desc) - [highest_view]

    universities_ord.unshift(highest_view)

    render json: universities_ord.reverse.to_json(), status: :ok
  end

  def add_view
    @city = City.find(params[:id])

    value = @city.views+ 1

    @city.update(views: value)

    render json: @city.to_json(), status: :ok
  end
end
