class Api::V1::QuestionnaireChoicesController < ApplicationController
  def index
    @questionnaire_choices = QuestionnaireChoice.includes(:answer).group("QuestionnaireChoices.questionnaire_choice_id").count

    render json: @questionnaire_choices
  end

  def create
    questionnaire_choice = QuestionnaireChoice.new(questionnaire_choice_params)

    if questionnaire_choice.save
      render json: questionnaire_choice
    else
      render status: 400, json: { status: 400, message: '記入漏れがあります' }
    end
  end

  def desrtroy
  end

  def count
    answers.count
  end

  def questionnaire_choice_params
    params.require(:questionnaire_choice).permit(:questionnaire_id, :choice)
  end
end
