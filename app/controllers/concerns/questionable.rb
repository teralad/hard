module Questionable
    def show_questions(from: nil, user:)
        conditions = { answers: { option_id: nil } }
        from = {id: rand(1..9), name: ['subject','topic','chapter'].sample, page: 1} unless from[:id].present?
        from = {id: 1, name: 'subject', page: 1} if Rails.env.test?
        conditions.merge!(construct_conditions(from)) unless from.nil?
        questions = Question.joins('left join answers on answers.question_id = questions.id').
                        joins({ chapter: { topic: { subject: :exam } } }).
                        where("user_id = ? or true",user.id).
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
        when 'exam'
            { exams: { id: from[:id] }}
        end
    end

    def create_answer(question_id:, option_id:, user_id:)
        Answer.create(question_id: question_id, option_id: option_id, user_id: user_id)
    end

    def exam_summary_builder(based_on)
        group_condition = if based_on.present?
            construct_params based_on
        else
        'chapters.id, topics.id, subjects.id, exams.id'
        end
        summaries = Question.joins('left join answers on answers.question_id = questions.id').
                    joins({:chapter=>{:topic=>{:subject=>:exam}}}).
                    group(group_condition).
                    select("sum(if(answers.option_id is not null and answers.option_id = questions.correct_option_id,1,0)) correct_answers_count, 
                            sum(if(answers.id is null,1,0)) unanswerd_count, 
                            sum(if(answers.id is not null and answers.option_id is null,1,0)) skipped_answers_count, 
                            sum(if(answers.option_id is not null and answers.option_id != questions.correct_option_id,1,0)) wrong_answers_count, 
                            count(questions.id) total_questions").
                    select(group_condition).as_json
        @summaries = summaries.map { |ques_summary|
        ques_summary['correct_percent'] = ((ques_summary['correct_answers_count'].to_f/ques_summary['total_questions'].to_f)*100).round(2)
        ques_summary['incorrect_percent'] = ((ques_summary['wrong_answers_count'].to_f/ques_summary['total_questions'].to_f)*100).round(2)
        ques_summary['skipped_percent'] = ((ques_summary['skipped_answers_count'].to_f/ques_summary['total_questions'].to_f)*100).round(2)
        ques_summary['unanswered_percent'] = ((ques_summary['unanswerd_count'].to_f/ques_summary['total_questions'].to_f)*100).round(2)
        ques_summary
        }
        @summaries
    end

    def construct_params(from)
        case from 
        when 'chapter'
          'chapters.id'
        when 'exam'
          'exams.id'
        when 'topic'
          'topics.id'
        when 'subject'
          'subjects.id'
        end
    end 
end