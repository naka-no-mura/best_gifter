class Api::V1::AnswersController < ApplicationController
  def index
    # @answers = Answer.all.includes(:questionnaire_choice, :questionnaire)

    @answer_counts = Answer.group(:questionnaire_choice_id).count
    render json: @answer_counts
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer
    else
      render status: 400, json: { status: 400, message: 'このアンケートには投票済みです' }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :questionnaire_choice_id, :questionnaire_id)
  end
end
