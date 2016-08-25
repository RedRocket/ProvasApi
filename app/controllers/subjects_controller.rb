class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
    @courses = Course.all
  end

  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path, notice: 'Disciplina criada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @courses = Course.all
  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subjects_path, notice: 'Disciplina atualizada com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :course_id)
    end
end
