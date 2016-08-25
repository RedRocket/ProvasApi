class Api::ExamsController < ApplicationController
  before_action :set_exam, only: [:update, :destroy]
  def show
    @exam = Exam.find(params[:id])
    render json: @exam.to_json(include: :exam_images), status: :ok
  end

  def create
  end

  def update
  end

  def delete
  end

  def add_view
    @exam = Exam.find(params[:id])

    value = @exam.views + 1

    @exam.update(views: value)

    render json: @exam.to_json(), status: :ok
  end

  private
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.permit(:name, :subject_id, :visible, :views, :period)
    end
end
