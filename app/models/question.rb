class Question < ApplicationRecord
    has_many :answers
    belongs_to :chapter
    has_many :options
    belongs_to :correct_option, class_name: 'Option', foreign_key: :correct_option_id, optional: true

    def exam
        chapter.topic.subject.exam
    end
end