class Api::V1::QuestionnaireChoicesController < ApplicationController
  def index
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

  def questionnaire_choice_params
    params.require(:questionnaire_choice).permit(:questionnaire_id, :choice)
  end
end
