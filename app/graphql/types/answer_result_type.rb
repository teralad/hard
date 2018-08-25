class Types::AnswerResultType < Types::BaseObject
    field :id, Integer, null: false
    field :question_id, Integer, null: false
    field :option_id, Integer, null: true
    field :user_id, Integer, null: false
end