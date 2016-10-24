class Api::ScoresController < ApplicationController

  def create
    @score = Score.create(score_params)
    render json: @score.to_json(), status: :ok
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.permit(:value, :user_id, :exam_id)
    end
end
