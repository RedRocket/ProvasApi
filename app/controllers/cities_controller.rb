class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  def index
    @cities = City.all
  end

  def new
    @city = City.new
    @states = State.all
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to cities_path, notice: 'Cidade criada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @states = State.all
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to cities_path, notice: 'Cidade atualizada com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_path, notice: "Cidade apagada"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :state_id)
    end
end
