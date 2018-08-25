module Questionable
    def show_questions(from: nil)
        current_user = User.find 1
        conditions = { answers: { option_id: nil } }
        from = {id: rand(1..9), name: ['subject','topic','chapter'].sample, page: 1} unless from[:id].present?
        conditions.merge!(construct_conditions(from)) unless from.nil?
        questions = Question.joins('left join answers on answers.question_id = questions.id').
                        joins({ chapter: { topic: { subject: :exam } } }).
                        where("user_id = ? or true",current_user.id).
                        where(conditions).order(:id)
        questions
    end

    def construct_conditions(from)
        case from[:name]
        when 'subject'
            { subjects: { id: from[:id] }}
        when 'topic'
            { topics: { id: from[:id] }}
        when 'chapter'
            { chapters: { id: from[:id] }}
        end
    end
end