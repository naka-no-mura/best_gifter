# json.array! @questionnaire, :id, :gender, :relationship, :text
# json.questionnaires @questionnaires do |questionnaire|
#   json.id questionnaire.id
#   json.gender questionnaire.gender
#   json.relationship questionnaire.relationship
#   json.text questionnaire.text
# end

json.set! @answer_counts