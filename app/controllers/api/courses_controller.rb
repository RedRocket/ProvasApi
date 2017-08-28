class Api::CoursesController < ApplicationController

  #
  # Return group of subjects in a courses
  #
  def subjects_in_courses
    @subjects = Course.find(params[:id]).subjects.order(name: :asc)
    render json: @subjects.to_json(), status: :ok
  end
end
