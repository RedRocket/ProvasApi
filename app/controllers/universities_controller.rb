class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]
  def index
    @universities = University.all
  end

  def new
    @university = University.new
    @cities = City.all
  end

  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to universities_path, notice: 'Universidade criada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @cities = City.all
  end

  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to universities_path, notice: 'Universidade atualizada com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_params
      params.require(:university).permit(:name, :city_id)
    end
end
