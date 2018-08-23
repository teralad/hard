class Question < ApplicationRecord
    has_many :answers
    belongs_to :chapter
    has_many :options
    belongs_to :correct_option, class: 'Option', foreign_key: :correct_option_id, optional: true
end