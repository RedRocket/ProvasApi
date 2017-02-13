class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  def index
    @exams = Exam.includes(:subject)
  end

  def show
    @photos = @exam.exam_images
  end

  def new
    @exam = Exam.new
    @subjects = Subject.all
    @users = User.all
  end

  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to exams_path, notice: 'Prova criada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @subjects = Subject.all
    @users = User.all
  end

  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to exams_path, notice: 'Prova atualizada com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id]).includes(:subject)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name, :subject_id, :visible, :views, :period, :user_id, :anonymous)
    end
end
