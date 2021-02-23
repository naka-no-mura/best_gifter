class Api::V1::QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all.includes(:user)

    # @questionnaires = Questionnaire.joins(:questionnaire_choices, :answers).group("questionnaires.id").select("questionnaires.*, questionnaire_choices.*, answers.*")

    # @questionnaires = Questionnaire.joins(:questionnaire_choices, :answers).select("questionnaires.*, questionnaire_choices.*, count(*) as answer_count").group("questionnaire_choices.id")

    # @questionnaires = Questionnaire.includes(:questionnaire_choices, :answers).joins(:questionnaire_choices, :answers).select("questionnaire_choices.*, answers.*, count(*) as answer_count").group("questionnaire_choices.id")

    # @questionnaires = Questionnaire.joins(:questionnaire_choices, :answers).select("questionnaires.*, questionnaire_choices.*, count(*) as answers").group("questionnaire_choices.id")
    # @questionnaires = Questionnaire.eager_load(:questionnaire_choices, :answers).select("questionnaires.*, questionnaire_choices.*")

    # @questionnaires = QuestionnaireChoice.group(:questionnaire_id)

    render json: @questionnaires.to_json(include: :questionnaire_choices)

    # render json: @questionnaires.to_json(include: [:questionnaire_choices], methods: :count)

    # render json: @questionnaires
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

  def count
    answers.count
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(:user_id, :text, :relationship, :gender, :age)
  end
end

# [
#   {
#     id: 1,
#     text: "朝ごはんは何派派？",
#     choices: [
#       { id: 1, choice: "パン", asnwer_counts: 4 },
#       { id: 2, choice: "和食", asnwer_counts: 1 },
#       { id: 3, choice: "グラノーラ", asnwer_counts: 2 },
#     ]
#   },
#   {
#     id: 2,
#     text: "好きなスポーツは？",
#     choices: [
#       { id: 4, choice: "テニス", asnwer_counts: 2 },
#       { id: 5, choice: "水泳", asnwer_counts: 2 },
#       { id: 6, choice: "バドミントン", asnwer_counts: 3 },
#     ]
#   },
# ]