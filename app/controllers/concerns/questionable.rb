module Questionable
    def show_questions(from: nil)
        if from.nil?
            conditions = {}
        else
            conditions = construct_conditions(from)
        end
        questions = Question.joins({:chapter=>{:topic=>{:subject=>:exam}}}).where(conditions)
        questions
    end

    def construct_conditions(from)
        case from[:name]
        when 'subject'
            {:subjects => {id: from[:id]} }
        when 'topic'
            {:topics => {id: from[:id]} }
        when 'chapter'
            {:chapters => {id: from[:id]} }
        end
    end
end