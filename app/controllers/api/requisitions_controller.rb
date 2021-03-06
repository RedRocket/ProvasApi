class Api::RequisitionsController < ApplicationController
  before_action :set_requisition, only: [:show, :edit, :update, :destroy]
  def index
    @requisitions = Requisition.all
  end

  def create
    @requisition = Requisition.create(requisition_params)
    render json: @requisition.to_json(), status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requisition
      @resquisition = Requisition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requisition_params
      params.permit(:text, :user_id)
    end
end
