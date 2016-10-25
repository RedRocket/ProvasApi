class Api::ScoresController < ApplicationController

  def create
    @score = Score.create(score_params)

    @exam = @score.exam
    @exam.update(feedback_avarage: (@exam.scores.sum(:value)/@exam.scores.size))

    render json: @score.to_json(), status: :ok
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.permit(:value, :user_id, :exam_id)
    end
end
