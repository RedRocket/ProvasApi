class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @universities = University.all
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'Curso criado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @universities = University.all
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'Curso atualizado com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :university_id)
    end
end
