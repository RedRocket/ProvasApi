class Api::ExamsController < ApplicationController
  before_action :set_exam, only: [:update, :destroy]
  def show
    @exam = Exam.find(params[:id])
    render json: @exam.to_json(include: :exam_images), status: :ok
  end

  def create
    @exam = Exam.create(exam_params)

    render json: @exam.to_json(), status: :ok
  end

  def get_images
    @images = Exam.find(params[:id]).exam_images

    render json: @images.to_json(), status: :ok
  end

  def get_thumb
    @image = Exam.find(params[:id]).exam_images.first

    render json: @image.to_json(only: [:image_uncompressed, :exam_id]), status: :ok
  end

  def add_image
    @image = ExamImage.new(image_uncompressed: params[:image], exam_id: params[:exam_id])
    @image.save!
    @image.process_images

    @exam = Exam.find(params[:exam_id])

    if @exam.visible == false
      @exam.update(visible: true)
    end

    render json: @image.to_json(), status: :ok
  end

  def list
    @exams = Exam.where(subject_id: params[:id]).visible

    render json: @exams.to_json(include: :user), status: :ok
  end

  def remove_images
    ExamImage.find(params[:id]).destroy

    render json: {}.to_json(), status: :ok
  end


  def update
  end

  def delete
    Exam.find(params[:id]).destroy

    render json: {}.to_json(), status: :ok
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
      params.permit(:name, :subject_id, :views, :period, :user_id, :exam_id, :image, :anonymous, :professor_name)
    end
end
