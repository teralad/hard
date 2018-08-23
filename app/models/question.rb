class Question < ApplicationRecord
    has_many :answers
    has_and_belongs_to_many :options
    belongs_to :correct_option, class: 'Option', foreign_key: :correct_option_id, optional: true

end
