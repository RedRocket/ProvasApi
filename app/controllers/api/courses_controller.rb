class Api::CoursesController < ApplicationController
  def subjects_in_courses
    @subjects = Course.find(params[:id]).subjects
    render json: @subjects.to_json(), status: :ok
  end
end
