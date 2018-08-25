class Types::ExamSummaryType < Types::BaseObject
    graphql_name 'ExamSummary'
  
    field :id, Integer, null: true
    field :correct_answers_count, Float, null: false
    field :unanswerd_count, Float, null: false
    field :skipped_answers_count, Float, null: false
    field :wrong_answers_count, Float, null: false
    field :total_questions, Float, null: false
    field :correct_percent, Float, null: false
    field :incorrect_percent, Float, null: false
    field :skipped_percent, Float, null: false
    field :unanswered_percent, Float, null: false
end