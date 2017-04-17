class Api::ComplaintsController < ApplicationController
  def create
    @complaint = Complaint.create(complaint_params)

    render json: @exam.to_json(), status: :ok
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:text, :exam_id, :user_id)
    end
end
