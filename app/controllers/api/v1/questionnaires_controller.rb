class Api::V1::QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[show destroy]

  def index
    @questionnaires = Questionnaire.all.includes(:user).order(created_at: :desc)

    render json: @questionnaires.to_json(include: :questionnaire_choices)
  end

  def show
    render json: @questionnaire.to_json(include: :questionnaire_choices)
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
    @questionnaire.destroy!

    render json: @qestionnaire
  end

  def my_questionnaires
    @my_questionnaires = Questionnaire.where(user_id: params[:user_id]).order(created_at: :desc)

    render json: @my_questionnaires.to_json(include: :questionnaire_choices)
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:user_id, :text, :relationship, :gender, :age)
  end
end
