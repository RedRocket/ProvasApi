class Api::SubjectsController < ApplicationController

  #
  # Return group of exams in a subject
  #
  def exams_in_subjects
    @exams = Subject.find(params[:id]).exams
    render json: @exams.to_json(include: :user), status: :ok
  end

  def show
    @subject = Subject.find(params[:id])
    render json: @subject.to_json(), status: :ok
  end
end
