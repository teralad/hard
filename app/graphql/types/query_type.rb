module Types
  class QueryType < Types::BaseObject
    include Questionable

    field :questions, [Types::QuestionType], null: false do
      argument :classification, Types::ClassificationType, required: true
      argument :classification_id, Integer, required: true
    end

    def questions(classification:, classification_id:)
      params = {name: classification,id: classification_id}
      user = User.find context[:user_id]
      show_questions(from: params, user: user)
    end

    field :exam_summary, [Types::ExamSummaryType], null: true do
      argument :classification, Types::ClassificationType, required: true
    end

    def exam_summary(classification:)
      exam_summary_builder(classification)
    end

  end
end
