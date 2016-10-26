class Api::ScoresController < ApplicationController

  def create
    @score = Score.new(score_params)

    @existing_score = Score.find_by user_id: @score.user_id, exam_id: @score.exam_id

    if @existing_score == nil
      @score.save
    else
      @existing_score.update(value: @score.value)
    end

    @exam = Exam.find(@score.exam_id)
    @exam.update(feedback_avarage: (@exam.scores.sum(:value)/@exam.scores.size))

    @scores = User.find(@score.user_id).scores
    render json: @scores.to_json(), status: :ok
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.permit(:value, :user_id, :exam_id)
    end
end
