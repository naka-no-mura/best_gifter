class Api::V1::QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all

    render json: @questionnaires.to_json(include: :questionnaire_choices)
  end

  def create
    questionnaire = Questionnaire.new(questionnaire_params)

    if questionnaire.save
      render json: questionnaire
    else
      render status: 400, json: { status: 400, message: '記入漏れがあります' }
    end
  end

  def destroy
  end

  def show
  end

  def update
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:user_id, :text, :relationship, :gender, :age)
  end
end
