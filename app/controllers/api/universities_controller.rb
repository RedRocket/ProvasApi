class Api::UniversitiesController < ApplicationController
  def show
    @university = University.find(params[:id])
    render json: @university.to_json(), status: :ok
  end

  #
  # Return group of courses in a university
  #
  def courses_in_university
    @courses = University.find(params[:id]).courses.order(name: :asc)
    render json: @courses.to_json(), status: :ok
  end

  #
  # Add view to university
  #
  def add_view
    @university = University.find(params[:id])

    value = @university.views + 1

    @university.update(views: value)

    render json: @university.to_json(), status: :ok
  end
end
